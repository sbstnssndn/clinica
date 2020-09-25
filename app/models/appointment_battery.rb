class AppointmentBattery < ApplicationRecord
  belongs_to :appointment
  belongs_to :battery
end
