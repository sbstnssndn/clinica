class AddAppointmentReferenceToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :appointment, foreign_key: true
  end
end
