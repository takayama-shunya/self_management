class AddIndexToconditions < ActiveRecord::Migration[5.2]
  def change
    add_index :conditions, :created_at
  end
end
