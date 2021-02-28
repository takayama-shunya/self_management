class CreateRecordDates < ActiveRecord::Migration[5.2]
  def change
    create_table :record_dates do |t|

      t.timestamps
    end
  end
end
