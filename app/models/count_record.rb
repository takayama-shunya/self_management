class CountRecord < SettingRecord
  
  belongs_to :user
  has_many :week_days, as: :recordable, dependent: :destroy
  has_many :record_dates, as: :recordable, dependent: :destroy
  has_many :weeks, through: :week_days
  has_one :comment, as: :commentable, dependent: :destroy
  
  attribute :content, :integer, default: 0

  # validates :title, presence: true, length: { maximum: 20 }
  # validates :unit, length: { maximum: 10 }
  validates :content, numericality: { only_integer: true,
                                      greater_than: -100,
                                      less_than: 100 }

end
