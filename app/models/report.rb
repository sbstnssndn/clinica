class Report < ApplicationRecord
  belongs_to :patient
  has_many :form_values
  accepts_nested_attributes_for :form_values

  belongs_to :appointment
end
