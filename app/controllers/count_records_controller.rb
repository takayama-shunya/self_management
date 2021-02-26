class CountRecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit show destroy update count_up count_down ]
  include Record

  def new
    @record = CountRecord.new
  end

  def create
    @record = current_user.count_records.build(count_record_params)
      if @record.save
        redirect_to top_index_path, notice: t('notice.created_record')
      else
        render :new
      end
  end

  def update
    if @record.update(count_record_params)
      redirect_to top_index_path, notice: t('notice.updated_record')
    else
      render :edit
    end
  end

  def count_up
    @record.increment(:content, 1)
    respond_to do |format|
      if @record.save
        format.js
      else
        format.js 
      end
    end
  end
 
  def count_down
    @record.increment(:content, -1)
    respond_to do |format|
      if @record.save
        format.js
      else
        format.js 
      end
    end
  end


  private

  def set_record
    @record = CountRecord.find(params[:id])
    redirect_to top_index_path, alert: t('alert.not_user') if current_user.id != @record.user_id
  end

  def count_record_params
    params.require(:count_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end
