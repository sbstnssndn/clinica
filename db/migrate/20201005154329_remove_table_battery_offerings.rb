class RemoveTableBatteryOfferings < ActiveRecord::Migration[5.2]
  def change
    drop_table :battery_offerings
  end
end
