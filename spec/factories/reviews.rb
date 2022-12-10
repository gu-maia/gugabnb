# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    description { Faker::Alphanumeric.alpha(number: 55) }
    title { Faker::Alphanumeric.alpha(number: 10) }
  end
end
