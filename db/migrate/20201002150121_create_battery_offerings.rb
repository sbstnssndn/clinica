class CreateBatteryOfferings < ActiveRecord::Migration[5.2]
  def change
    create_table :battery_offerings do |t|
      t.integer :price
      t.references :battery, foreign_key: true
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end
