class TimeRecordsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_record, only: %i[ show edit destroy update ]

  def new
    @record = TimeRecord.new
  end

  def create
    @record = current_user.time_records.build(time_record_params)
      if @record.save
        redirect_to top_index_path, notice: t('notice.created_record')
      else
        render :new
      end
  end

  def show
    @commented = @record.comment
    @comment = Comment.new
  end

  def edit
    respond_to do |format|
      format.js { render :edit }
      format.html { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @record.update(time_record_params)
        format.js { flash.now[:success] = t('flash.updated') }
        format.html { redirect_to top_index_path, notice: t('notice.updated_record') }
      else
        format.js
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @record.destroy
        format.js { flash.now[:success] = t('flash.destroyed') }
      else
        formato.html { redirect_to top_index_path, alert: t('alert.errors') }
      end
    end
  end

  private

  def set_record
    @record = TimeRecord.find(params[:id])
    redirect_to top_index_path, alert: t('alert.not_user') if current_user.id != @record.user_id
  end

  def time_record_params
    params.require(:time_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end
