class AutomaticRecordsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def sleep_improvement_plan
    @record_1 = CheckRecord.sleep_improvement_plan_create_1(current_user.id)
    @record_2 = CheckRecord.sleep_improvement_plan_create_2(current_user.id)
    @record_3 = TimeRecord.sleep_improvement_plan_create_3(current_user.id)
    if @record_1 && @record_2 && @record_3
      redirect_to setting_records_path, notice: t('notice.created_record')
    else
      redirect_to top_index_path, alert: t('alert.errors')
    end
  end

  private


end
