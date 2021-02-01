FactoryBot.define do
  factory :check_record do
    title { 'check' }
    unit { '' }
    content { false }
    association :user, factory: :test_user_1
  end
end
