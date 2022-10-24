# frozen_string_literal: true

class AddCheckoutUrlToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :checkout_url, :string
  end
end
