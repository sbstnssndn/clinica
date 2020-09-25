class Patient < ApplicationRecord
  validates_presence_of :rut
  validates_uniqueness_of :rut

  has_many :appointment_patients
  has_many :appointments, through: :appointment_patients
end
