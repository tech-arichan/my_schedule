FactoryBot.define do
  factory :task do
    title       {"test"}
    deadline    {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    detail      {"test detail"}
    priority_id {2}
    association :user 
  end
end
