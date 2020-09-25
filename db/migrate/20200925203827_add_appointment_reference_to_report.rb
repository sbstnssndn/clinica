class AddAppointmentReferenceToReport < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :appointment, foreign_key: true
  end
end
