FactoryBot.define do
  factory :count_record do
    title { 'count' }
    unit { '' }
    content { 0 }
    association :user, factory: :test_user_1
  end
end
