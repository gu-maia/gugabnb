# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, foreign_key: 'guest_id', class_name: 'User'

  has_one :host, through: :listing

  validates :stars, presence: true, numericality: { only_integer: true, in: 1..5 }
  validates :title, presence: true, length: { minimum: 10, maximum: 45 }
  validates :description, presence: true, length: { minimum: 50, maximum: 250 }
end
