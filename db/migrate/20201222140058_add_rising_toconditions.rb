class AddRisingToconditions < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :rising_time, :time, null: false
  end
end
