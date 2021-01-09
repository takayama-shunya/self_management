week_day =[0,1,2,3,4,5,6]
week_day.each do |day|
  Week.create!(
    dayname: day
  )
end