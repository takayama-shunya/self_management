class SettingRecord < ApplicationRecord
  
  # after_save :cumlative_value_create
  # after_update :cumlative_value_update

  scope :find_by_user, ->(user_id) { where(user_id: user_id) }
  scope :implementation_date, ->(dayname) { joins(:weeks).where(weeks: {dayname: dayname}) }

  validates :title, presence: true, length: { maximum: 20 }
  validates :unit, length: { maximum: 10 }

  private

  def cumlative_value_create
    if self.type != "CheckRecord"
      cumlative_value = self.build_cumlative_value(value: self.content) 
      cumlative_value.save
    end
  end

  def cumlative_value_uodate
    if self.type != "CheckRecord"
      cumlative_value = CumlativeValue.find(self.id)
      cumlative_value.update(set_record_action(self.type))
    end
  end

  def set_record_action(type)
    case type
    when "IntegerRecord" || "CountRecord"
      { value: (@cumlative_value.value.to_i + self.content.to_i).to_s }
    when "DecimalRecord"
      { value: (@cumlative_value.value.to_f + self.content.to_f).to_s }
    when "TimeRecord"
      time_record_value = (@cumlative_value.delete(':').to_i + self.copntent.delete(':').to_i).to_s
      time_record_value = time_record_value.insert(time_record_value.length - 2, ":")
      { value: time_record_value }
    end

  end



end
