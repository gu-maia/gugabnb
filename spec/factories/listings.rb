# frozen_string_literal: true

FactoryBot.define do
  factory :listing do
    guests { rand(1..99) }
    short_description { 'short_description' }
  end

  factory :random_listing, class: Listing do
  end
end
