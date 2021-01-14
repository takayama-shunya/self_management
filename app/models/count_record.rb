class CountRecord < SettingRecord
  
  belongs_to :user
  has_many :week_days, dependent: :destroy
  has_many :weeks, through: :week_days
  has_one :comment, as: :commentable, dependent: :destroy
  
  attribute :content, :integer, default: 0

  validates :title, presence: true, length: { maximum: 20 }
  validates :unit, length: { maximum: 10 }
  validates :content, numericality: { only_integer: true,
                                      greater_than_or_equal_to: 0,
                                      less_than: 1000 }

end
