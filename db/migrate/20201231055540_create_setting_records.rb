class CreateSettingRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :setting_records do |t|
      t.string :type
      t.string :title, null: false
      t.string :unit
      t.string :content, null: false
      t.string :implementation_date, null: false
      t.timestamps
    end
  end
end
