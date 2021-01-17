class WeekDay < ApplicationRecord
  belongs_to :week
  belongs_to :recordable, polymorphic: true
end
