class DecimalRecord < SettingRecord

  belongs_to :user
  attribute :content, :float

end
