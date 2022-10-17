# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :host, foreign_key: 'user_id', class_name: 'User'
  has_many :rooms, dependent: :destroy
  has_many :pricings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :images

  validates :short_description, presence: true
  validates :guests, numericality: { only_integer: true, in: 1..100 }

  enum status: {
    draft: 0,
    archived: 1
  }

  def active_pricing
    pricings.where(status: :active).first
  end

  def star_average
    reviews.average(:stars).round(2).to_s
  end

  def review_count
    reviews.size
  end
end
