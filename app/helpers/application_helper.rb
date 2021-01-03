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

end
