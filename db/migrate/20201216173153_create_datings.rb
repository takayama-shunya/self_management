class CreateDatings < ActiveRecord::Migration[5.2]
  def change
    create_table :datings do |t|
      t.date :date_at, null: false
      t.timestamps
    end
  end
end
