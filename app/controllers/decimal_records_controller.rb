class DecimalRecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit show destroy update ]


  def new
    @decimal_record = DecimalRecord.new
  end

  def create
    @decimal_record = current_user.decimal_records.build(decimal_record_params)
    if params[:back]
      render :new
    else
      if @decimal_record.save
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
    if @decimal_record.update(decimal_record_params)
      redirect_to top_index_path, notice: "updated condition"
    else
      rende :edit
    end
  end

  def destroy
    @decimal_record.destroy
    redirect_to top_index_path, notice: "deleted condition"
  end

  def show
  end

  private

  def set_record
    @decimal_record = DecimalRecord.find(params[:id])
  end

  def decimal_record_params
    params.require(:decimal_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end

