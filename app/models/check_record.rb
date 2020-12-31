class CheckRecord < SettingRecord

  belongs_to :user
  attribute :content, :integer

end
