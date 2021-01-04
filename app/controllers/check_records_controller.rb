class CheckRecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit show destroy update ]


  def new
    @check_record = CheckRecord.new
  end

  def create
    @check_record = current_user.check_records.build(check_record_params)
    if params[:back]
      render :new
    else
      if @check_record.save
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
    if @check_record.update(check_record_params)
      redirect_to top_index_path, notice: "updated condition"
    else
      rende :edit
    end
  end

  def destroy
    @check_record.destroy
    redirect_to top_index_path, notice: "deleted condition"
  end

  def show
  end

  private

  def set_record
    @check_record = CheckRecord.find(params[:id])
  end

  def check_record_params
    params.require(:check_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end
