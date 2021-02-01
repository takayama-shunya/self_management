FactoryBot.define do
  factory :first_condition, class: Condition do
    retirung_time { '00:30' }
    rising_time { "08:30" }
    sleep_time { 3 }
    sleep_quality { 3 }
    meal_count { 3 }
    stress_level { 3 }
    toughness { 3 }
    stress_recovery_balance { 3 }
    positive_level { 3 }
    enrichment_happiness_level { 3 }
    created_at { 1.days.ago }
    positive_comment { 'first_condition' }
    negative_comment { 'first_condition' }
    association :user, factory: :test_user_1
  end
  factory :second_condition, class: Condition do
    retirung_time { '00:30' }
    rising_time { "08:30" }
    sleep_time { 5 }
    sleep_quality { 5 }
    meal_count { 5 }
    stress_level { 5 }
    toughness { 5 }
    stress_recovery_balance { 5 }
    positive_level { 5 }
    enrichment_happiness_level { 5 }
    created_at { 2.days.ago }
    positive_comment { 'second_condition' }
    negative_comment { 'second_condition' }
    association :user, factory: :test_user_1
  end

end
