class CreateWeekDays < ActiveRecord::Migration[5.2]
  def change
    create_table :week_days do |t|
      t.integer :integer_record_id
      t.integer :decimal_record_id
      t.integer :time_record_id
      t.integer :check_record_id
      t.integer :count_record_id
      t.integer :week_id
      t.index :week_id
      t.timestamps
    end
  end
end
