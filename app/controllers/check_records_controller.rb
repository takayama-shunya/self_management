class CheckRecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_record, only: %i[ edit destroy update change_check_true change_check_false]


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
    respond_to do |format|
      format.html { render :edit }
    end
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

  def change_check_true
    @check_record.update!(content: true)
  end

  def change_check_false
    @check_record.update!(content: false)
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
