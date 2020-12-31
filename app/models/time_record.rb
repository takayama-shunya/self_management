class TimeRecord < SettingRecord

  belongs_to :user
  attribute :content, :time

end
