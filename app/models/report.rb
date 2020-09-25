class Report < ApplicationRecord
  belongs_to :appointment
  belongs_to :patient
  has_many :results

  accepts_nested_attributes_for :results

  validates_presence_of :appointment
  validates_presence_of :patient
end
