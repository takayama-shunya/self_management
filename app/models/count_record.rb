class CountRecord < SettingRecord
  
  belongs_to :user
  attribute :content, :integer

end
