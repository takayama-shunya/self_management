class CheckRecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_record, only: %i[ show edit destroy update change_check_true change_check_false]
  include Record

  def new
    @record = CheckRecord.new
  end

  def create
    @record = current_user.check_records.build(check_record_params)
      if @record.save
        redirect_to top_index_path, notice: t('notice.created_record')
      else
        render :new
      end
  end

  def update
    if @record.update(check_record_params)
      redirect_to top_index_path, notice: t('notice.updated_record')
    else
      rende :edit
    end
  end

  def change_check_true
    @record.update(content: true)
  end

  def change_check_false
    @record.update(content: false)
  end

  private

  def set_record
    @record = CheckRecord.find(params[:id])
    redirect_to top_index_path, alert: t('alert.not_user') if current_user.id != @record.user_id
  end

  def check_record_params
    params.require(:check_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end
