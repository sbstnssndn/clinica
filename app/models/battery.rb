class Battery < ApplicationRecord
  has_many :exam_selections
  has_many :exams, through: :exam_selections

  has_many :appointment_batteries
  has_many :appointments, through: :appointment_batteries

  validates_uniqueness_of :name
end
