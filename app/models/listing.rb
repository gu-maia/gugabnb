class Listing < ApplicationRecord
  belongs_to :host, foreign_key: 'user_id', class_name: 'User'
  has_many :rooms, dependent: :destroy
  has_many :pricings, dependent: :destroy
  has_many_attached :images
  
  validates :short_description, presence: true
  validates :guests, numericality: {only_integer: true, in: 1..100}

  enum status: {
    draft: 0,
    archived: 1
  }

  def active_pricing
    self.pricings.where(status: :active).first
  end
end
