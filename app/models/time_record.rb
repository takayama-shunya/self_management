class TimeRecord < SettingRecord

  belongs_to :user
  has_many :week_days, as: :recordable, dependent: :destroy
  has_many :record_dates, as: :recordable, dependent: :destroy
  has_many :weeks, through: :week_days
  has_one :comment, as: :commentable, dependent: :destroy
  has_one :cumlative_value, as: :recordable, dependent: :destroy

  validates :content, presence: true
  validates :unit, length: { maximum: 10 }

end
