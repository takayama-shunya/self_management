FactoryBot.define do
  factory :decimal_record do
    title { 'decimal' }
    unit { '' }
    content { 0 }
    association :user, factory: :test_user_1
  end
end
