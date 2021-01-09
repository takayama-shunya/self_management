class AddNotNullUnitToSeetingRecord < ActiveRecord::Migration[5.2]
  def change
    change_column_null :setting_records, :unit, false
  end
end
