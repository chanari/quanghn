FactoryBot.define do
  factory :short_link do
    short_path { Faker::Internet.password(min_length: 5, max_length: 5, mix_case: true) }
    original_url { Faker::Internet.url }
    user
  end
end
