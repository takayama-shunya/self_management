module Record
  extend ActiveSupport::Concern

  def show
    @commented = @record.comment
    @comment = Comment.new
    set_record_date
  end

  def edit
    respond_to do |format|
      format.js { render :edit }
      format.html { render :edit }
    end
  end

  def destroy
    respond_to do |format|
      if @record.destroy
        format.js { flash.now[:success] = t('flash.destroyed') }
      else
        formato.html { redirect_to top_index_path, alert: t('alert.errors') }
      end
    end
  end

  private

  def set_record_date
    @record_dates = RecordDate.find_record_date(@record.id)
    if @record.type == "CheckRecord"
      total_number = @record_dates.length
      value = @record_dates.group_by(&:itself).map{ |key value| [key, value.count] }.to_h
      gon.record_value = [value.fetch("true") / total_number * 100, value.fetch("false") / total_number * 100 ]
    else
      record_type_action(@record.type)
      gon.record_value = @record_value
      gon.record_created_at = @record_dates.reverse.map{ |r| r.created_at.strftime('%m/%d') }
      gon.chart_value_max = @record_value.max * 1.1
      @record_value.min < 0 ?
        gon.chart_value_min = @record_value.min * 1.2 :
        gon.chart_value_min = 0
    end
  end

  def record_type_action(record_type)
    if record_type == "Timerecord" 
      @record_value = []
      @record_dates.reverse.each do |record|
        value = record.content.split(':')
        @record_value << value[0].to_i + value[1].to_i * 0.01
      end
    else
      @record_value = @record_dates.reverse.map{ |r| r.content.to_i }
    end
  end

end


