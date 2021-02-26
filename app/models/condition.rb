class Condition < ApplicationRecord
  
  belongs_to :user
  has_one :comment, as: :commentable, dependent: :destroy

  paginates_per 10

  validates :negative_comment, :positive_comment, 
            length: { maximum:100 }
  validates :retirung_time, :rising_time, :sleep_time, :sleep_quality,
            :meal_count, :stress_level, :toughness, :stress_recovery_balance,
            :positive_level, :enrichment_happiness_level,
            presence: true
  
  #scopeでnilだと、必ずActiveRecord::Relationオブジェクトを返す
  def self.find_condition(date)
    where(created_at: date.in_time_zone.all_day).take
  end

  scope :find_by_user, ->(user_id) { where(user_id: user_id) }

  def set_condition_value
    [ self.sleep_time, self.sleep_quality,
      self.meal_count, self.stress_level, 
      self.toughness, self.stress_recovery_balance, 
      self.positive_level, self.enrichment_happiness_level ]
  end
  
  def self.set_condition_average_value
    [ self.average(:sleep_time).to_f, self.average(:sleep_quality).to_f,
      self.average(:meal_count).to_f, self.average(:stress_level).to_f,
      self.average(:toughness).to_f, self.average(:stress_recovery_balance).to_f,
      self.average(:positive_level).to_f, self.average(:enrichment_happiness_level).to_f ]
  end

end
