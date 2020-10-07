class CreateCesoProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :ceso_profiles do |t|
      t.string :name
      t.string :last_name
      t.belongs_to :branch, foreign_key: true

      t.timestamps
    end
  end
end
