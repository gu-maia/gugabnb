class AddDefaultStatusToListing < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:listings, :status, from: nil, to: 0)
  end
end
