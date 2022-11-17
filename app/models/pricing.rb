# frozen_string_literal: true

class Pricing < ApplicationRecord
  belongs_to :listing

  validates :value, presence: true
  validates :cleaning_fee, presence: true
  validates :listing, presence: true
  validates :status, presence: true

  scope :active_pricing, ->{ where(status: :active).first }

  enum status: {
    active: 0,
    inactive: 1
  }

  def value_in_cents
    (value * 100).to_i
  end
end
