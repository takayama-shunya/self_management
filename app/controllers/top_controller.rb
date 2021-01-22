class TopController < ApplicationController
  
  before_action :authenticate_user!
  before_action :what_day_condition, only: %i[ index ]
  before_action :condition_value, only: %i[ index ]
  before_action :condition_average_value, only: %i[ index ]
  before_action :today_record, only: %i[ index ]


  def index
  end

  private

  def set_top_condition
    @condition = current_user.conditions.find_by(created_at: @date.in_time_zone.all_day)
  end

  def what_day_condition
    if @date = params[:date_condition]
      set_top_condition
    else
      today_condition
    end
  end

  def condition_value
    what_day_condition
    if @condition.present?
      gon.value = [
        @condition.sleep_time, @condition.sleep_quality,
        @condition.meal_count, @condition.stress_level, 
        @condition.toughness, @condition.stress_recovery_balance, 
        @condition.positive_level, @condition.enrichment_happiness_level
      ]
      @condition_score = gon.value.sum
    end
  end

  def condition_average_value
    what_day_condition
    if @condition.present?
      condition = Condition.where(user_id: current_user.id)
      gon.average_value = [
        condition.average(:sleep_time).to_f, condition.average(:sleep_quality).to_f,
        condition.average(:meal_count).to_f, condition.average(:stress_level).to_f,
        condition.average(:toughness).to_f, condition.average(:stress_recovery_balance).to_f,
        condition.average(:positive_level).to_f, condition.average(:enrichment_happiness_level).to_f
      ]
      @condition_average_score = gon.average_value.sum
    end
  end

  def today_record
    date = Time.zone.now
    @dayname = week_day[date.wday]

    # @today_integer_records = IntegerRecord.where(user_id: current_user.id).joins(:weeks).where(weeks: {dayname: date})
    # @today_decimal_records = DecimalRecord.where(user_id: current_user.id).joins(:weeks).where(weeks: {dayname: date})
    model = [IntegerRecord, DecimalRecord, TimeRecord, CheckRecord, CountRecord]
    @today_records = []

    model.each do |m|
      @today_records << m.where(user_id: current_user.id).joins(:weeks).where(weeks: {dayname: @dayname})
    end

    @today_records = @today_records.flatten!
    
    # @today_records.push(
    #    IntegerRecord.where(user_id: current_user.id).joins(:weeks).where(weeks: {dayname: date}),
    #    DecimalRecord.where(user_id: current_user.id).joins(:weeks).where(weeks: {dayname: date}),
    #    TimeRecord.where(user_id: current_user.id).joins(:weeks).where(weeks: {dayname: date}),
    #    CheckRecord.where(user_id: current_user.id).joins(:weeks).where(weeks: {dayname: date}),
    #    CountRecord.where(user_id: current_user.id).joins(:weeks).where(weeks: {dayname: date})
    #  ).flatten!
  end

end


