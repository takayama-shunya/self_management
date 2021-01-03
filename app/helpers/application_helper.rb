module ApplicationHelper

  def choose_record_type
    if controller_name == 'integer_records'
      integer_records_path      
    elsif controller_name == 'decimal_records'
      decimal_records_path
    elsif controller_name == 'time_records'
      time_records_path
    elsif controller_name == 'check_records'
      check_records_path
    elsif controller_name == 'count_records'
      count_records_path
    end
  end

  def record_type
   if @record_type = "IntegerRecord"
     integer_record_path(@record_id)
   elsif @record_type = "DecimalRecord"
     decimal_record_path(@record_id)
   elsif @record_type = "TimeRecord"
     time_record_path(@record_id)
   elsif @record_type = "CountRecord"
     count_record_path(@record_id)
   elsif @record_type = "CheckRecord"
     check_recprd_path(@record_id)
   end 
  end

  def edit_record_type
    if @record_type = "IntegerRecord"
      edit_integer_record_path(@record_id)
    elsif @record_type = "DecimalRecord"
      edit_decimal_record_path(@record_id)
    elsif @record_type = "TimeRecord"
      edit_time_record_path(@record_id)
    elsif @record_type = "CountRecord"
      edit_count_record_path(@record_id)
    elsif @record_type = "CheckRecord"
      edit_check_recprd_path(@record_id)
   end 
  end


end
