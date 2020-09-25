class Appointment < ApplicationRecord
  belongs_to :user
  has_many :battery_selections, dependent: :destroy
  has_many :exam_batteries, through: :battery_selections
  has_many :patients
  has_many :reports

  accepts_nested_attributes_for :patients, allow_destroy: true
end
