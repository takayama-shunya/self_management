class Week < ApplicationRecord
  
  has_many :week_days, dependent: :destroy
  has_many :integer_records, through: :week_days
  has_many :decimal_records, through: :week_days
  has_many :time_records, through: :week_days
  has_many :count_records, through: :week_days
  has_many :check_records, through: :week_days

  enum dayname: { 日: 0, 月: 1, 火: 2, 水: 3, 木: 4, 金: 5, 土: 6, }
end
