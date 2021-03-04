class CumlativeValue < ApplicationRecord
  
  belongs_to :recordable, polymorphic: true

end
