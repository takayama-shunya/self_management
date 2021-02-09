FactoryBot.define do
  factory :integer_record do
    title { 'integer' }
    unit { '' }
    content { 0 }
    association :user, factory: :test_user_1
  end
end
