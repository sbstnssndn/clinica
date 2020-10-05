class BatteryOffering < ApplicationRecord
  belongs_to :battery
  belongs_to :branch
end
