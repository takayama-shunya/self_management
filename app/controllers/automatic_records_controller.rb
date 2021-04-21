class AutomaticRecordsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
  end
  
  def sleep_improvement_plan
    created = [:stop_drinking, :bath, :exercise].all? do |type|
      if type == :exercise
        record = current_user.time_records.build(sleep_improvement_plan_args(type))
      else
        record = current_user.check_records.build(sleep_improvement_plan_args(type))
      end
      record.build_comment(content: comment_content(type)).save if record.save
      record.persisted? && record.comment.persisted?
    end
    if created 
      redirect_to setting_records_path, notice: t('notice.created_record')
    else
      redirect_to top_index_path, alert: t('alert.errors') 
    end
  end
  
  private
  
  def sleep_improvement_plan_args(type)
    case type
    when :stop_drinking
    {
        title: "禁酒",
        unit: "",
        content: false,
        week_ids: [ 2, 4, 6 ],
      }
    when :bath
      {
        title: "入浴",
        unit: "",
        content: false,
        week_ids: [ 1, 2, 3, 4, 5, 6, 7 ],
      }
    when :exercise
      {
        title: "運動",
        unit: "時間",
        content: "00:00",
        week_ids: [ 1, 2, 3, 4, 5, 6, 7 ],
      }
    else
      {}
    end
  end

  def comment_content(type)
    case type
    when :stop_drinking
      "睡眠改善プラン。"
    when :bath
      "睡眠改善プラン。入浴時間は眠る2時間〜1時間前半前に15分程度が理想"
    when :exercise
      "睡眠改善プラン。1週間で150分の運動を行う。45〜60分以上の中強度の運動を週2回行えると理想"
    else
      ""
    end
  end
  
end
