class Appointment < ApplicationRecord
  has_many :appointment_patients
  has_many :patients, through: :appointment_patients, dependent: :destroy
  accepts_nested_attributes_for :patients, allow_destroy: true

  has_many :appointment_batteries
  has_many :batteries, through: :appointment_batteries, dependent: :destroy

  has_many :reports

  belongs_to :user

  validates_presence_of :patients

  def exam_selections
    ExamSelection.where(battery: batteries.order(:order))
  end
end
