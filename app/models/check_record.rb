class CheckRecord < SettingRecord

  belongs_to :user
  has_many :week_days, as: :recordable, dependent: :destroy
  has_many :weeks, through: :week_days
  has_one :comment, as: :commentable, dependent: :destroy
  
  attribute :content, :boolean, default: false
  # validates :title, presence: true, length: { maximum: 20 }

  def self.sleep_improvement_plan_create_1(user_id)
    record_1 = self.new(
      title: "禁酒",
      unit: "",
      content: false,
      week_ids: [ 2, 4, 6 ],
      user_id: user_id )
    if record_1.save
      record_1.build_comment(
        content: "睡眠改善プラン。"
      ).save
    end
  end

  def self.sleep_improvement_plan_create_2(user_id)
    record_2 = self.create(
      title: "入浴",
      unit: "",
      content: false,
      week_ids: [ 1, 2, 3, 4, 5, 6, 7 ],
      user_id: user_id )
    if record_2.save
      record_2.build_comment(
        content: "睡眠改善プラン。入浴時間は眠る2時間〜1時間前半前に15分程度が理想"
      ).save
    end
  end

end
