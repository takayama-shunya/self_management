class SettingRecord < ApplicationRecord
  
  after_create :cumlative_value_create
  after_update :cumlative_value_update

  scope :find_by_user, ->(user_id) { where(user_id: user_id) }
  scope :implementation_date, ->(dayname) { joins(:weeks).where(weeks: {dayname: dayname}) }

  validates :title, presence: true, length: { maximum: 20 }
  validates :unit, length: { maximum: 10 }

  private

  def cumlative_value_create
    unless self.type == "CheckRecord"
      cumlative_value = self.build_cumlative_value(value: self.content) 
      cumlative_value.save
    end
  end

  def cumlative_value_update
    if self.saved_change_to_attribute?("content")
      unless self.type == "CheckRecord"
        cumlative_value = CumlativeValue.find_by(recordable_id: self.id)
        cumlative_value.update!(set_record_action(self.type))
      end
    end
  end

  def set_record_action(type)
    case type
    when "IntegerRecord"
      { value: (cumlative_value.value.to_i + self.content.to_i).to_s }
    when "CountRecord"
      coount_record_value = self.content - self.attribute_before_last_save("content")
      { value: (cumlative_value.value.to_i + coount_record_value).to_s }
    when "DecimalRecord"
      { value: (cumlative_value.value.to_f + self.content.to_f).truncate(3).to_s }
    when "TimeRecord"
      time_record_value = (cumlative_value.value.delete(':').to_i + self.content.delete(':').to_i).to_s
      time_record_value = time_record_value.insert(time_record_value.length - 2, ":")
      { value: time_record_value }
    else
      { value: (cumlative_value.value.to_i + self.content.to_i).to_s }
    end
  end

end
