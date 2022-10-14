class Listing < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many_attached :images
  
  validates :short_description, presence: true
  validates :guests, numericality: {only_integer: true, in: 1..100}

  enum status: {
    draft: 0,
    archived: 1
  }
end
