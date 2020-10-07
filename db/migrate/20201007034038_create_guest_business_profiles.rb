class CreateGuestBusinessProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_business_profiles do |t|
      t.string :name
      t.string :last_name
      t.string :position
      t.string :phone
      t.string :business_name
      t.text :business_address
      t.string :business_rut
      t.string :business_activity

      t.timestamps
    end
  end
end
