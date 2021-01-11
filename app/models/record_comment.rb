class RecordComment < ApplicationRecord
  belongs_to :count_record
  belongs_to :decimal_record
  belongs_to :integer_record
  belongs_to :time_record
  belongs_to :check_record
end
