class TopController < ApplicationController
  
  before_action :authenticate_user!
  before_action :what_day_condition, only: %i[ index ]
  before_action :condition_value, only: %i[ index ]
  before_action :today_record, only: %i[ index ]


  def index
  end

  private

  def set_top_condition
    @condition = current_user.conditions.find_condition(@date)
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
      gon.value = @condition.set_condition_value
      @condition_score = gon.value.sum
      condition_average_value
    end
  end

  def condition_average_value
    conditions = Condition.find_by_user(current_user.id)
    gon.average_value = conditions.set_condition_average_value
    @condition_average_score = gon.average_value.sum
  end

  def today_record
    date = Time.zone.now
    dayname = week_day[date.wday] #dateを曜日数字に変換して配列から取り出す

    model = [IntegerRecord, DecimalRecord, TimeRecord, CheckRecord, CountRecord]
    today_records = []

    model.each do |m|
      today_records << m.find_by_user(current_user.id).implementation_date(dayname)
    end

    @today_records = today_records.flatten!
  end

end


