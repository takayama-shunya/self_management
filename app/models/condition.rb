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
  
  # scope :find_condition, -> (date) { where(created_at: date.in_time_zone.all_day).take }
  def self.find_condition(date)
    where(created_at: date.in_time_zone.all_day).take
  end
  
end
