# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: 'User'
  has_one :host, through: :listing

  scope :as_guest, ->(id) { where(guest_id: id) }
  validate :guest_count_must_be_within_listing_limit

  before_create :no_booking_overlap
  before_create :set_payment_pending

  enum status: {
    inactive: 0,
    pending_payment: 1,
    payment_approved: 2,
    host_approval_and_payment_complete: 3,
    processing_refund: 4,
    cancelled: 5,
    refunded: 6
  }

  def set_payment_pending
    self.status = :pending_payment
  end

  def no_booking_overlap
    errors.add(:base, 'This period is not available. Check the listing calendar') if listing.bookings.where(
      '? <= end_date and start_date <= ?', start_date, end_date
    ).any?
  end

  def guest_count_must_be_within_listing_limit
    errors.add(:guests, "can't be outside the limit defined by the host.") unless (1..listing.guests).include?(guests)
  end

  def distance_of_time_in_days
    (end_date.to_date - start_date.to_date).to_i
  end

  def checkout_session_url
    checkout_session.url
  end

  def issue_refund
    refund = Stripe::Refund.create(payment_intent: payment_intent_id)
    update!(status: :processing_refund, stripe_refund_id: refund.id)
    refund
  end

  def checkout_session
    listing.maybe_create_stripe_product

    checkout_session = Stripe::Checkout::Session.create({
                                                          success_url: 'http://0.0.0.0:3000/bookings',
                                                          cancel_url: 'http://0.0.0.0:3000/bookings',
                                                          line_items: [
                                                            {
                                                              price_data: {
                                                                currency: 'BRL',
                                                                product: listing.product_id,
                                                                unit_amount: listing.active_pricing.value_in_cents
                                                              },
                                                              quantity: distance_of_time_in_days
                                                            }
                                                          ],
                                                          mode: 'payment'
                                                        })
    update!(checkout_session_id: checkout_session.id)
    checkout_session
  end
end
