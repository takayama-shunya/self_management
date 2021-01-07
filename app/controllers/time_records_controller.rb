class TimeRecordsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit destroy update ]

  def new
    @time_record = TimeRecord.new
  end

  def create
    @time_record = current_user.time_records.build(time_record_params)
    if params[:back]
      render :new
    else
      if @time_record.save
        redirect_to top_index_path, notice: "created condition"
      else
        render :new
      end
    end
  end

  def index
  end

  def edit
    respond_to do |format|
      format.js { render :edit }
      format.html { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @record.update!(time_record_params)
        format.js { render :index }
        format.html { redirect_to top_index_path, notice: "updated condition" }
      else
        render :edit
      end
    end
  end

  def destroy
    @time_record.destroy
    redirect_to top_index_path, notice: "deleted condition"
  end

  def content_only_update
    @record = @decimal_records
    respond_to do |format|
      if @record.update!(content_only_update_params)
        flash.now[:notice] = 'update record content'
        format.js { render :content_only_update }
      else
        flash.now[:notice] = 'error update'
        format.js { render :content_only_update_error }
      end
    end
  end

  private

  def set_record
    @record = TimeRecord.find(params[:id])
  end

  def time_record_params
    params.require(:time_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end
