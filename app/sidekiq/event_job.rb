# frozen_string_literal: true

class EventJob
  include Sidekiq::Job

  def perform(event_id)
    event = Event.find(event_id)
    case event.source
    when 'stripe'
      stripe_event = Stripe::Event.construct_from(
        JSON.parse(event.request_body, symbolize_names: true)
      )
      handle_stripe(stripe_event)
      event.update(
        event_type: stripe_event.type,
        error_message: '',
        status: :processed
      )
    else
      event.update(
        error_message: "Unknown source #{event.source}"
      )
    end
  end

  def handle_stripe(stripe_event)
    checkout_session = stripe_event.data.object
    case stripe_event.type
    when 'checkout.session.completed'
      booking = Booking.find_by_checkout_session_id(checkout_session.id)
      booking.update(status: :payment_approved, payment_intent_id: checkout_session.payment_intent)
      booking.send_payment_approved_notifications
    when 'charge.refunded'
      refund = checkout_session.refunds.data[0]
      booking = Booking.find_by_stripe_refund_id(refund.id)
      booking.update(status: :refunded)
    end
  end
end
