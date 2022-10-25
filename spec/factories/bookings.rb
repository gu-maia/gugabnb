# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    guests { rand(1..20) }
    checkout_url { 'http:localhost' }
  end

  factory :random_booking, class: 'Booking' do
  end
end
