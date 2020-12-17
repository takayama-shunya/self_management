class AddDatingIdToConditions < ActiveRecord::Migration[5.2]
  def change
    add_reference :conditions, :dating, foreign_key: true
  end
end
