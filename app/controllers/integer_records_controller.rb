class IntegerRecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit show destroy update ]


  def new
    @integer_record = IntegerRecord.new
  end

  def create
    @integer_record = current_user.integer_records.build(integer_record_params)
    if params[:back]
      render :new
    else
      if @integer_record.save
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
    if @integer_record.update(integer_record_params)
      redirect_to top_index_path, notice: "updated condition"
    else
      rende :edit
    end
  end

  def destroy
    @integer_record.destroy
    redirect_to top_index_path, notice: "deleted condition"
  end

  def show
  end

  private

  def set_record
    @integer_record = IntegerRecord.find(params[:id])
  end

  def integer_record_params
    params.require(:integer_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end
