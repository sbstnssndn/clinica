class Appointment < ApplicationRecord
  has_many :appointment_patients
  has_many :patients, through: :appointment_patients
  accepts_nested_attributes_for :patients, allow_destroy: true

  has_many :appointment_batteries
  has_many :batteries, through: :appointment_batteries

  has_many :reports
end
