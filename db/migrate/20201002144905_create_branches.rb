class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.text :health_permit

      t.timestamps
    end
  end
end
