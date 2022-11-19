FactoryBot.define do
  factory :wish do
    wished { false }
    user { nil }
    listing { nil }
  end
end
