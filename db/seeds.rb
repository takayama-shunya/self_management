week_day =[0,1,2,3,4,5,6]
week_day.each do |day|
  Week.create!(
    dayname: day
  )
end

3.times do |n|
  User.create!(
    name: "user_#{n + 1}",
    email: "user_#{n + 1}@icloud.com",
    password: "password" )
end

condition_list_1 = []
condition_list_2 = []
user_1 = User.find_by(name: "user_1")
user_2 = User.find_by(name: "user_2")
15.times do |n|
  condition_list_1 << 
    { retirung_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :midnight),
      rising_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :morning),
      sleep_time: rand(1..5),
      sleep_quality: rand(1..5),
      meal_count: rand(1..5),
      stress_level: rand(1..5),
      toughness: rand(1..5),
      stress_recovery_balance: rand(1..5),
      positive_level: rand(1..5),
      enrichment_happiness_level: rand(1..5),
      user_id: user_1.id,
      created_at: (n - 1).days.ago }
end
5.times do |n|
  condition_list_2 << 
    { retirung_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :midnight),
      rising_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :morning),
      sleep_time: rand(1..5),
      sleep_quality: rand(1..5),
      meal_count: rand(1..5),
      stress_level: rand(1..5),
      toughness: rand(1..5),
      stress_recovery_balance: rand(1..5),
      positive_level: rand(1..5),
      enrichment_happiness_level: rand(1..5),
      user_id: user_2.id,
      created_at: (n - 1).days.ago }
end
Condition.create!(condition_list_1)
Condition.create!(condition_list_2)

model = [ IntegerRecord, DecimalRecord, TimeRecord, CountRecord ]
model.each do |m|
  m.create!(
    title: "#{m}",
    unit: "test",
    content: rand(1..99),
    user_id: user_1.id,
    week_ids: Week.ids.sample
  )
end
CheckRecord.create!(
  title: "CheckRecord",
  unit: "",
  content: false,
  user_id: user_1.id,
  week_ids: Week.ids.sample
)


