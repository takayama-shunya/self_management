FactoryBot.define do
  factory :check_record_1, class: CheckRecord do
    title { 'check' }
    unit { '' }
    content { false }
    association :user, factory: :test_user_1
  end
  factory :check_record_2, class: CheckRecord do
    title { 'check' }
    unit { '' }
    content { true }
    association :user, factory: :test_user_1
  end
end
