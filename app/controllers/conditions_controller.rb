class ConditionsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_condition, only: %i[ edit show destroy update ]

  def new
    @condition = Condition.new
  end

  def create
    @condition = current_user.conditions.build(condition_params)
    if params[:back]
      render :new
    else
      if @condition.save
        redirect_to condition_path(@condition.id), notice: "created condition"
      else
        render :new
      end
    end
  end

  def index
    @conditions = Condition.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    if @condition.update(condition_params)
      redirect_to condition_path(@condition.id), notice: "updated condition"
    else
      rende :edit
    end
  end

  def destroy
    @condition.destroy
    redirect_to top_index_path, notice: "deleted condition"
  end

  def show
  end

  private

  def set_condition
    @condition = Condition.find(params[:id])
  end

  def condition_params
    params.require(:condition).permit(
      :retirung_time, :rising_time, :sleep_time, :sleep_quality, :meal_count, :stress_level,
      :toughness, :stress_recovery_balance, :positive_level, :enrichment_happiness_level,
      :negative_comment, :positive_comment)
  end

end
