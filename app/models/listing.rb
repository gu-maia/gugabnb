# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :host, foreign_key: 'user_id', class_name: 'User'
  has_many :rooms, dependent: :destroy
  has_many :pricings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :wishes
  has_many_attached :images

  delegate :active_pricing, to: :pricings
  validates :short_description, presence: true
  validates :guests, numericality: { only_integer: true, in: 1..100 }

  enum status: {
    draft: 0,
    archived: 1,
    published: 2
  }

  def star_average
    reviews.average(:stars).round(2).to_s
  end

  def review_count
    reviews.size
  end

  def maybe_create_stripe_product(activity_status = true)
    return unless product_id.blank?

    response = Stripe::Product.create({
                                        name: "listing_#{id}",
                                        active: activity_status,
                                        metadata: {
                                          listing_id: id
                                        }
                                      })

    update(product_id: response.id)
  end
end
