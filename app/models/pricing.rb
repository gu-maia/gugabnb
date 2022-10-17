# frozen_string_literal: true

class Pricing < ApplicationRecord
  belongs_to :listing

  validates :value, presence: true
  validates :cleaning_fee, presence: true
  validates :listing, presence: true
  validates :status, presence: true

  enum status: {
    active: 0,
    inactive: 1
  }
end
