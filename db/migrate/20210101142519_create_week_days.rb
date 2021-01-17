class CreateWeekDays < ActiveRecord::Migration[5.2]
  def change
    create_table :week_days do |t|
      t.references :recordable, polymorphic: true, index: true
      t.integer :week_id
      t.index :week_id
      t.timestamps
    end
  end
end
