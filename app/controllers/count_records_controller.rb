class CountRecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit show destroy update ]


  def new
    @count_record = CountRecord.new
  end

  def create
    @count_record = current_user.count_records.build(count_record_params)
    if params[:back]
      render :new
    else
      if @count_record.save
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
    if @count_record.update(count_record_params)
      redirect_to top_index_path, notice: "updated condition"
    else
      rende :edit
    end
  end

  def destroy
    @count_record.destroy
    redirect_to top_index_path, notice: "deleted condition"
  end

  def show
  end

  private

  def set_record
    @count_record = CountRecord.find(params[:id])
  end

  def count_record_params
    params.require(:count_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end
