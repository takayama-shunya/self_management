FactoryBot.define do
  factory :time_record do
    title { 'time' }
    unit { '' }
    content { '10:00' }
    association :user, factory: :test_user_1

  end
end
