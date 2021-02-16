class AutomaticRecordsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def sleep_improvement_plan
    sleep_improvement_plan_create
  end

  private

  def sleep_improvement_plan_create
    @check_record_1 = current_user.check_records.build(
      title: "禁酒",
      unit: "",
      content: false,
      week_ids: [ 2, 4, 6 ])
    @check_record_2 = current_user.check_records.build(
      title: "入浴",
      unit: "",
      content: false,
      week_ids: [ 1, 2, 3, 4, 5, 6, 7 ])
    @time_record = current_user.time_records.build(
      title: "運動",
      unit: "時間",
      content: "00:00",
      week_ids: [ 1, 2, 3, 4, 5, 6, 7 ])
    if @check_record_1.save && @check_record_2.save && @time_record.save
      @comment_1 = @check_record_1.build_comment(
        content: "睡眠改善プラン。")
      @comment_2 = @check_record_2.build_comment(
        content: "睡眠改善プラン。入浴時間は眠る2時間〜1時間前半前に15分程度が理想")
      @comment_3 = @time_record.build_comment(
        content: "睡眠改善プラン。1週間で150分の運動を行う。45〜60分以上の中強度の運動を週2回行えると理想")
      if @comment_1.save && @comment_2.save && @comment_3.save
        redirect_to setting_records_path, notice: t('notice.created_record')
      end
    else
      redirect_to top_index_path, alert: t('alert.errors')
    end
  end

end
