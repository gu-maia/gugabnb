# frozen_string_literal: true

class CreatePricings < ActiveRecord::Migration[7.0]
  def change
    create_table :pricings do |t|
      t.decimal :value
      t.decimal :cleaning_fee
      t.integer :status
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
