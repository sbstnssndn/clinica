class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :appointment, foreign_key: true
      t.references :patient, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
