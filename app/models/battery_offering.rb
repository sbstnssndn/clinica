class BatteryOffering < ApplicationRecord
  belongs_to :battery
  belongs_to :branch

  accepts_nested_attributes_for :branch
end
