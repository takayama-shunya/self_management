class RecordDate < ApplicationRecord
  
  belongs_to :recordable, polymorphic: true

  scope :find_record_date, ->(record_id) { where(recordable_id: record_id).order(created_at: :desc).limit(30) }

end
