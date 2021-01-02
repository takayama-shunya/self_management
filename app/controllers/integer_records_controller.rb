class IntegerRecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit show destroy update ]


  def new
    @record = IntegerRecord.new
  end

  def create
    @record = current_user.integer_records.build(record_params)
    if params[:back]
      render :new
    else
      if @record.save
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
    if @record.update(record_params)
      redirect_to top_index_path, notice: "updated condition"
    else
      rende :edit
    end
  end

  def destroy
    @record.destroy
    redirect_to top_index_path, notice: "deleted condition"
  end

  def show
  end

  private

  def set_condition
    @record = IntegerRecord.find(params[:id])
  end

  def record_params
    params.require(:integer_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end
