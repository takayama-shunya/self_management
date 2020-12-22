class RenameTitleColumnToRetirungTime < ActiveRecord::Migration[5.2]
  def change
    rename_column :conditions, :retirung_rising_time, :retirung_time
  end
end
