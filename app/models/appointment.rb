class Appointment < ApplicationRecord
  belongs_to :user
  has_many :battery_selections
  has_many :exam_batteries, through: :battery_selections
  has_many :patients

  accepts_nested_attributes_for :patients
end
