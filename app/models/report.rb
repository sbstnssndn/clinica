class Report < ApplicationRecord
  belongs_to :patient
  has_many :form_values
  accepts_nested_attributes_for :form_values
  accepts_nested_attributes_for :patient

  belongs_to :appointment

  # Necesito saber de qué batería estoy usando tal examen, para poder hacer
  # form_value.form_field.exam.battery
  # { battery: Battery.last, exams: [Exam.first, Exam.last] }
  # Otra idea:
  # Hacer que form_value tenga relación con exam_selection, y así
  # podría saber a qué batería pertenece el examen que se seleccionó, además
  # de su orden dentro de la batería

  def build_form_values!
    appointment.batteries.each do |battery|
      battery.exams.each do |exam|
        # por cada examen, ver sus campos y construir un campo respuesta por
        # cada uno. Se puede agregar battery_id a form_field para saber
        # en qué batería estoy llenando los campos del examen
        exam.form_fields.map do |field|
          form_values.create!(form_field: field, value: nil)
        end
      end
    end
  end
end
