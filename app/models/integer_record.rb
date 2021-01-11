class IntegerRecord < SettingRecord

  belongs_to :user
  has_many :week_days, dependent: :destroy
  has_many :weeks, through: :week_days
  has_one :record_comment, dependent: :destroy, class_name: "RecordComment"
  attribute :content, :integer

end

