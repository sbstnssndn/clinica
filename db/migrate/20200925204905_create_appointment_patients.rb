class CreateAppointmentPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_patients do |t|
      t.references :appointment, foreign_key: true
      t.references :patient, foreign_key: true
      t.boolean :ecg

      t.timestamps
    end
  end
end
