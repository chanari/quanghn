FactoryBot.define do
  factory :short_link do
    short_path { "String" }
    original_url { Faker::Internet.url }
    user
  end
end
