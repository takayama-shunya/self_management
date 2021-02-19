class AutomaticRecordsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def sleep_improvement_plan
    @record_1 = current_user.check_records.build(sip_check_record_1)
    @record_2 = current_user.check_records.build(sip_check_record_2)
    @record_3 = current_user.time_records.build(sip_time_record_1)
    if @record_1.save && @record_2.save && @record_3.save
      @comment_1 = @record_1.build_comment(comment_1)
      @comment_2 = @record_2.build_comment(comment_2)
      @comment_3 = @record_3.build_comment(comment_3)
      if @comment_1.save && @comment_2.save && @comment_3.save
        redirect_to setting_records_path, notice: t('notice.created_record')
      end
    else
      redirect_to top_index_path, alert: t('alert.errors')
    end
  end

  private

  def sip_check_record_1
    { title: "禁酒",
      unit: "",
      content: false,
      week_ids: [ 2, 4, 6 ] }
  end

  def sip_check_record_2
    { title: "入浴",
      unit: "",
      content: false,
      week_ids: [ 1, 2, 3, 4, 5, 6, 7 ] }
  end

  def sip_time_record_1
    { title: "運動",
      unit: "時間",
      content: "00:00",
      week_ids: [ 1, 2, 3, 4, 5, 6, 7 ] }
  end

  def comment_1
    { content: "睡眠改善プラン。" }
  end

  def comment_2
    { content: "睡眠改善プラン。入浴時間は眠る2時間〜1時間前半前に15分程度が理想" }
  end

  def comment_3
    { content: "睡眠改善プラン。1週間で150分の運動を行う。45〜60分以上の中強度の運動を週2回行えると理想" }
  end

end
