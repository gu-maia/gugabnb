class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: "User"
  has_one :host, through: :listing

  validate :guest_count_must_be_within_listing_limit

  def guest_count_must_be_within_listing_limit
    errors.add(:guests, "can't be outside the limit defined by the host.") unless (1..listing.guests).include?(guests)
  end

  def distance_of_time_in_days
    (end_date.to_date - start_date.to_date).to_i
  end

  def checkout_session_url
    checkout_session.url
  end

  def checkout_session 
    listing.maybe_create_stripe_product

    Stripe::Checkout::Session.create({
      success_url: 'https://example.com/success',
      cancel_url: 'https://example.com/cancel',
      line_items: [
        {
          price_data: {
            currency: "BRL",
            product: listing.product_id,
            unit_amount: listing.active_pricing.value_in_cents,
          },
          quantity: distance_of_time_in_days
        },
      ],
      mode: 'payment',
    })
  end

  def checkout_session_url
    checkout_session.url
  end
end
