FactoryBot.define do
  factory :storage do
    title  {"テスト"}
    detail {"テスト、詳細"}
    association :user 

    after(:build) do |storage|
      storage.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
