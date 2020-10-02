class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :rut
      t.string :number
      t.string :bank
      t.string :email
      t.belongs_to :branch, foreign_key: true

      t.timestamps
    end
  end
end
