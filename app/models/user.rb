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

  def full_name
    "#{first_name} #{last_name}"
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
