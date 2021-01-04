class ChangeDatetypeDaynameOfWeeks < ActiveRecord::Migration[5.2]
  def change
    change_column :weeks, :dayname, 'integer USING CAST(dayname AS integer)'
  end
end
