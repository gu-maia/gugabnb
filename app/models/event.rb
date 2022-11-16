# frozen_string_literal: true

class Event < ApplicationRecord
  enum status: {
    processed: 0,
    failed: 1,
    pending: 2
  }
end
