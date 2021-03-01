class RecordDate < ApplicationRecord
  belongs_to :recordable, polymorphic: true
end
