class SettingRecord < ApplicationRecord
  
  # after_update :record_content_uodate

  scope :find_by_user, ->(user_id) { where(user_id: user_id) }
  scope :implementation_date, ->(dayname) { joins(:weeks).where(weeks: {dayname: dayname}) }

  validates :title, presence: true, length: { maximum: 20 }
  validates :unit, length: { maximum: 10 }

  private

  # def record_content_uodate
  #   if self.saved_change_to_content
  #     if RecordDate.where()
  #     RecordDate.create(content: self.content)
  #   end 
  # end



end
