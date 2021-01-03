class TimeRecordsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit show destroy update ]

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
  end

  def update
    if @time_record.update(time_record_params)
      redirect_to top_index_path, notice: "updated condition"
    else
      rende :edit
    end
  end

  def destroy
    @time_record.destroy
    redirect_to top_index_path, notice: "deleted condition"
  end

  def show
  end

  private

  def set_record
    @time_record = TimeRecord.find(params[:id])
  end

  def time_record_params
    params.require(:time_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end
