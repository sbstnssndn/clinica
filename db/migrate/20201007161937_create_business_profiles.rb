class CreateBusinessProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :business_profiles do |t|
      t.string :name
      t.string :last_name
      t.belongs_to :branch, foreign_key: true
      t.boolean :payment_agreement

      t.timestamps
    end
  end
end
