class RemoveBatteryIdAndPatientIdFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :battery_id,  :bigint
    remove_column :appointments, :patient_id, :biging
  end
end
