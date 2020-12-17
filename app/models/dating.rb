class Dating < ApplicationRecord

  has_many :conditions, dependent: :destroy
  accepts_nested_attributes_for :conditions, allow_destroy: true
end
