class CreateRecordDates < ActiveRecord::Migration[5.2]
  def change
    create_table :record_dates do |t|
      t.string :content, null: false
      t.references :recordable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
