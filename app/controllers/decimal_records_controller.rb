class DecimalRecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit destroy update ]


  def new
    @record = DecimalRecord.new
  end

  def create
    @record = current_user.decimal_records.build(decimal_record_params)
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
    respond_to do |format|
      format.js { render :edit }
      format.html { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @record.update!(decimal_record_params)
        format.js { render :index }
        format.html { redirect_to top_index_path, notice: "updated condition" }
      else
        render :edit
      end
    end
  end

  def destroy
    @record.destroy
  end

  private

  def set_record
    @record = DecimalRecord.find(params[:id])
  end

  def decimal_record_params
    params.require(:decimal_record).permit(
      :type, :title, :unit, :content, week_ids: [])
  end

end

