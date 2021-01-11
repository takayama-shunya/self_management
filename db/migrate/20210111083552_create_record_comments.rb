class CreateRecordComments < ActiveRecord::Migration[5.2]
  def change
    create_table :record_comments do |t|
      t.references :setting_record, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
