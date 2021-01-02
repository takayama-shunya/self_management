class WeekDay < ApplicationRecord
  belongs_to :week
  belongs_to :integer_record, optional: true
  belongs_to :decimal_record, optional: true
  belongs_to :time_record, optional: true
  belongs_to :check_record, optional: true
  belongs_to :count_record, optional: true
end
