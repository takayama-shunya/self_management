class RebnameClumnImplementationDateToSettingRecords < ActiveRecord::Migration[5.2]
  def up
    remove_column :setting_records, :implementation_date
  end

  def down
    add_column :setting_records, :implementation_date, :string
  end
end
