class CreateAdministrativeProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :administrative_profiles do |t|
      t.string :name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
