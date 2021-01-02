class Week < ApplicationRecord
  has_many :week_days, dependent: :destroy
  has_many :integer_records, through: :week_days
end
