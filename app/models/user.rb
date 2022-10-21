# frozen_string_literal: true

class User < ApplicationRecord
  pay_customer stripe_attributes: :stripe_attributes
  pay_customer default_payment_processor: :stripe

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings
  has_many :reviews, through: :listings
  has_many :bookings_as_guest, foreign_key: 'guest_id', class_name: 'Booking'

  def full_name
    "#{first_name} #{last_name}"
  end

  def ongoing_bookings(listing)
    bookings_as_guest.where(listing: listing,
                            status: %i[pending_payment payment_approved
                                       host_approval_and_payment_complete])
  end

  def stripe_attributes(pay_customer)
    {
      address: {
        city: pay_customer.owner.city,
        country: pay_customer.owner.country
      },
      metadata: {
        pay_customer_id: pay_customer.id,
        user_id: id # or pay_customer.owner_id
      }
    }
  end

  # Has to be changed. Reviews should be linked through a booking. Will leave like that for now to tidy up the frontend
  def reviews_as_host_count
    reviews.size
  end
end
