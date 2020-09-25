class Report < ApplicationRecord
  belongs_to :patient
  has_many :form_values
  accepts_nested_attributes_for :form_values

  belongs_to :appointment

  def build_form_values
    appointment.batteries.each do |battery|
      battery.exams.each do |exam|
        # por cada examen, ver sus campos y construir un campo respuesta por cada uno
      end
    end
  end
end
