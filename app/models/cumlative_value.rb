class CumlativeValue < ApplicationRecord
  
  belongs_to :commentable, polymorphic: true

end
