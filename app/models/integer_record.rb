class IntegerRecord < SettingRecord

  belongs_to :user
  attribute :content, :integer

end
