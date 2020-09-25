class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.boolean :completed
      t.references :patient, foreign_key: true
      t.text :conclusions

      t.timestamps
    end
  end
end
