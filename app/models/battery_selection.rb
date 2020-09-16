class BatterySelection < ApplicationRecord
  belongs_to :appointment
  belongs_to :exam_battery
end
