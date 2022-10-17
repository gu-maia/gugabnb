# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: { to_table: :users }
      t.integer :stars
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
