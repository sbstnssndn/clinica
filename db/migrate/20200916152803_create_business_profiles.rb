class CreateBusinessProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :business_profiles do |t|
      t.integer :agreement

      t.timestamps
    end
  end
end
