FactoryBot.define do
  factory :event do
    title      {"テスト"}
    content    {"テスト"}
    start_time {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    association :user 
  end
end
