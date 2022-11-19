class Wish < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  scope :wished, -> { where(wished: true) }
end
