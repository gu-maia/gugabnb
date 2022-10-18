# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: 'User'
  has_one :host, through: :listing

  validate :guest_count_must_be_within_listing_limit

  def guest_count_must_be_within_listing_limit
    errors.add(:guests, "can't be outside the limit defined by the host.") unless (1..listing.guests).include?(guests)
  end
end
