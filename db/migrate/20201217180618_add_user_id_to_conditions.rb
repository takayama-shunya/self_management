class AddUserIdToConditions < ActiveRecord::Migration[5.2]
  def change
    add_reference :conditions, :user, foreign_key: true
  end
end
