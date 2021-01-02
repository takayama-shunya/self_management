week_day =["月","火","水","木","金","土","日"]
week_day.each do |day|
  Week.create!(
    dayname: "#{day}"
  )
end