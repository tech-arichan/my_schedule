FactoryBot.define do
  factory :task do
    title       {"テスト、タイトル"}
    deadline    {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    detail      {"テスト、詳細"}
    priority_id {2}
    association :user 
  end
end
