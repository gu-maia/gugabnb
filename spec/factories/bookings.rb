# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    guests { rand(1..20) }
    checkout_url { 'http:localhost' }
    start_date { '01/01/22' }
    end_date { '02/01/22' }
  end

  factory :random_booking, class: 'Booking' do
  end
end
