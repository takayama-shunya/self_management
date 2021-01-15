class TimeRecord < SettingRecord

  belongs_to :user
  has_many :week_days, dependent: :destroy
  has_many :weeks, through: :week_days
  has_one :comment, as: :commentable, dependent: :destroy

  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :unit, length: { maximum: 10 }



end
