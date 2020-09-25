class CreateAppointmentBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_batteries do |t|
      t.references :appointment, foreign_key: true
      t.references :battery, foreign_key: true

      t.timestamps
    end
  end
end
