# frozen_string_literal: true

class AddStripeRefundIdToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :stripe_refund_id, :string
  end
end
