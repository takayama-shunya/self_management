class DecimalRecord < SettingRecord

  belongs_to :user
  has_many :week_days, dependent: :destroy
  has_many :weeks, through: :week_days
  attribute :content, :float

end
