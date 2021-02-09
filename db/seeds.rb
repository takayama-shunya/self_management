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
      created_at: (n + 1).days.ago }
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
      created_at: (n + 1).days.ago }
end
Condition.create!(condition_list_1)
Condition.create!(condition_list_2)

# model = [ IntegerRecord, DecimalRecord, TimeRecord, CountRecord ]
# model.each do |m|
#   number = rand(1..7)
#   m.create!(
#     title: "#{m}",
#     unit: "test",
#     content: rand(1..99),
#     user_id: user_1.id,
#     week_ids: Week.ids.sample(number)
#   )
# end

IntegerRecord.create!(
  title: "収支",
  unit: "円",
  content: 10000,
  user_id: user_1.id,
  week_ids: Week.ids.sample(4)
)

DecimalRecord.create!(
  title: "体重",
  unit: "キロ",
  content: 55.5,
  user_id: user_1.id,
  week_ids: Week.ids.sample(5)
)

TimeRecord.create!(
  title: "運動時間",
  unit: "分",
  content: "15:00",
  user_id: user_1.id,
  week_ids: Week.ids.sample(3)
)

CountRecord.create!(
  title: "喫煙本数",
  unit: "本",
  content: 0,
  user_id: user_1.id,
  week_ids: Week.ids.sample(7)
)

CheckRecord.create!(
  title: "チェック",
  unit: "",
  content: false,
  user_id: user_1.id,
  week_ids: Week.ids.sample(3)
)


