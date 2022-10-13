class Listing < ApplicationRecord
  belongs_to :user
  
  validates :short_description, presence: true
  validates :guests, numericality: {only_integer: true, in: 1..100}

  enum status: {
    draft: 0,
    archived: 1
  }
end
