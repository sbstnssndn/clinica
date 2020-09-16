class CreateGuestPersonProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_person_profiles do |t|
      t.string :name
      t.string :rut
      t.datetime :birthday
      t.string :phone
      t.string :job_title
      t.string :email

      t.timestamps
    end
  end
end
