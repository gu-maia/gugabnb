# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings
  has_many :reviews, through: :listings
  has_many :bookings, class_name: 'Booking', foreign_key: 'guest_id'

  def full_name
    "#{first_name} #{last_name}"
  end

  # Has to be changed. Reviews should be linked through a booking. Will leave like that for now to tidy up the frontend
  def reviews_as_host_count
    reviews.size
  end
end
