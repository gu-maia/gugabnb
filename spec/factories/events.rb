FactoryBot.define do
  factory :event do
    source { "MyString" }
    request_body { "MyText" }
    status { 1 }
    event_type { "MyString" }
  end
end
