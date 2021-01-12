class TimeRecord < SettingRecord

  belongs_to :user
  has_many :week_days, dependent: :destroy
  has_many :weeks, through: :week_days
  has_one :comment, as: :commentable, dependent: :destroy
end
