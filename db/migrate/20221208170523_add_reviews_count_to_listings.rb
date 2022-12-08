class AddReviewsCountToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :reviews_count, :integer
  end
end
