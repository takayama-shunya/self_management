class CheckRecord < SettingRecord

  belongs_to :user
  has_many :week_days, as: :recordable, dependent: :destroy
  has_many :record_dates, as: :recordable, dependent: :destroy
  has_many :weeks, through: :week_days
  has_one :comment, as: :commentable, dependent: :destroy
  
  attribute :content, :boolean, default: false
  # validates :title, presence: true, length: { maximum: 20 }

end
