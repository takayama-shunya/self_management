class CreateConditionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :condition_comments do |t|
      t.references :condition, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
