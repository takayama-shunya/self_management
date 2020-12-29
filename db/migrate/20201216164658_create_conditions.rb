class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.time :retirung_rising_time, null: false
      t.integer :sleep_time, null: false
      t.integer :sleep_quality, null: false
      t.integer :meal_count, null: false
      t.integer :stress_level, null: false
      t.integer :toughness, null: false
      t.integer :stress_recovery_balance, null: false
      t.integer :positive_level, null: false
      t.integer :enrichment_happiness_level, null: false
      t.string :negative_comment
      t.string :positive_comment
      t.timestamps
    end
  end
end
