class AddPaymentIntentIdToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :payment_intent_id, :string
  end
end
