FactoryBot.define do
  factory :memo do
    memo      {"テスト"}
    association :user 
  end
end
