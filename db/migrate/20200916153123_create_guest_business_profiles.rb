class CreateGuestBusinessProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_business_profiles do |t|
      t.string :name
      t.string :job_title
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
