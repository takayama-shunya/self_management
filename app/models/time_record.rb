class TimeRecord < SettingRecord

  belongs_to :user
  has_many :week_days, as: :recordable, dependent: :destroy
  has_many :weeks, through: :week_days
  has_one :comment, as: :commentable, dependent: :destroy

  validates :content, presence: true
  validates :unit, length: { maximum: 10 }


  def self.sleep_improvement_plan_create_3(user_id)
    record_3 = self.new(
      title: "運動",
      unit: "時間",
      content: "00:00",
      week_ids: [ 1, 2, 3, 4, 5, 6, 7 ],
      user_id: user_id)
    if record_3.save
      record_3.build_comment(
        content: "睡眠改善プラン。1週間で150分の運動を行う。45〜60分以上の中強度の運動を週2回行えると理想"
      ).save
    end
  end

end
