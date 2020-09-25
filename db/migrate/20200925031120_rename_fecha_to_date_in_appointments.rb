class RenameFechaToDateInAppointments < ActiveRecord::Migration[5.2]
  def change
    rename_column :appointments, :fecha, :date
  end
end
