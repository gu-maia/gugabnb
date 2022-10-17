# frozen_string_literal: true

class AddAddressFieldsToListing < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :city, :string
    add_column :listings, :state, :string
    add_column :listings, :postal_code, :string
    add_column :listings, :country, :string
    add_column :listings, :lat, :string
    add_column :listings, :lng, :string
    add_column :listings, :address_line1, :string
    add_column :listings, :address_line2, :string
  end
end
