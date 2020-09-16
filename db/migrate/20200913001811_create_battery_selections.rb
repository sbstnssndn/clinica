class CreateBatterySelections < ActiveRecord::Migration[5.2]
  def change
    create_table :battery_selections do |t|
      t.references :appointment, foreign_key: true
      t.references :exam_battery, foreign_key: true

      t.timestamps
    end
  end
end
