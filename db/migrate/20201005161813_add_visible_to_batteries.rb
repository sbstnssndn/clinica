class AddVisibleToBatteries < ActiveRecord::Migration[5.2]
  def change
    add_column :batteries, :visible, :boolean, default: true
  end
end
