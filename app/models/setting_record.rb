class SettingRecord < ApplicationRecord
  

  scope :find_by_user, ->(user_id) { where(user_id: user_id) }
  scope :implementation_date, ->(dayname) { joins(:weeks).where(weeks: {dayname: dayname}) }

end
