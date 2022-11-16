# frozen_string_literal: true

class EventJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end
