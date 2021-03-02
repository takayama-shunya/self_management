class CreateRecordCumulativeValues < ActiveRecord::Migration[5.2]
  def change
    create_table :record_cumulative_values do |t|
      t.string :value, null: false
      t.references :recordable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
