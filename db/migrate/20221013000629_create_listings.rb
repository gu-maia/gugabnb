# frozen_string_literal: true

class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :short_description
      t.string :long_description
      t.integer :status
      t.integer :guests, default: 1

      t.timestamps
    end
  end
end
