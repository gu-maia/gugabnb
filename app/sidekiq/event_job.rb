# frozen_string_literal: true

class EventJob
  include Sidekiq::Job

  def perform(event)
    case event.source
    when "stripe"
        stripe_event = Stripe::Event.construct_from(
        JSON.parse(event.request_body, symbolize_names: true)
        )
      handle_stripe(stripe_event)
      event.update(
        event_type: stripe_event.type,
        error_message: "",
        status: :processed)
    rescue => e
      event.update(error_message: e.message, status: :failed)
    else
      event.update(
        error_message: "Unknown source #{event.source}"
    end 
  end
end
