class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :name
      t.text :certification
      t.integer :order

      t.timestamps
    end
  end
end
