FactoryBot.define do
  factory :week_1, class: Week do
    dayname { "日" }
  end
  factory :week_2, class: Week do
    dayname { "月" }
  end
  factory :week_3, class: Week do
    dayname { "火" }
  end
  factory :week_4, class: Week do
    dayname { "水" }
  end
  factory :week_5, class: Week do
    dayname { "木" }
  end
  factory :week_6, class: Week do
    dayname { "金" }
  end
  factory :week_7, class: Week do
    dayname { "土" }
  end
end
