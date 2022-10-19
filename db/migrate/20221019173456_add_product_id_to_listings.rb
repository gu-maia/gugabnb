class AddProductIdToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :active, :boolean
    add_column :listings, :product_id, :string
  end
end
