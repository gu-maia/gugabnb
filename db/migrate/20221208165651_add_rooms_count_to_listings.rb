# frozen_string_literal: true

class AddRoomsCountToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :rooms_count, :integer
  end
end
