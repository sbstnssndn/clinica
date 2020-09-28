class Report < ApplicationRecord
  belongs_to :patient
  has_many :form_values, dependent: :destroy
  accepts_nested_attributes_for :form_values
  accepts_nested_attributes_for :patient

  belongs_to :appointment

  # Este método devuelve una lista de hashes. Cada hash tiene una batería
  # y los exámenes que contiene. Sólo se muestran exámenes no repetidos.
  # Si una batería no tiene exámenes no repetidos, no se muestra dicha batería.
  # Se pueden mostrar directamente estos exámenes en el PDF. Están ordenados
  # según el orden de la batería en forma ascendente
  def batteries_with_exams
    result = []
    batteries.order(:order).each do |battery|
      temp = { battery: battery, exams: [] }
      if result.empty?
        battery.exams.map {|e| temp[:exams] << e}
      else
        battery.exams.each do |exam|
          result.each do |hash|
            next if hash[:exams].include? exam
            temp[:exams] << exam
          end
        end
      end
      result << temp if temp[:exams].size > 0
    end
    result
  end

  def batteries
    Battery
      .joins(:exam_selections)
      .where(exam_selections: appointment.exam_selections)
      .distinct
  end

  def exams
    Exam
      .joins(:exam_selections)
      .where(exam_selections: appointment.exam_selections)
      .distinct
    # appointment.exam_selections.map { |es| es.exam }.uniq
  end

  def create_form_values!
    exams.each do |exam|
      exam.form_fields.each do |field|
        form_values.create!(form_field: field, value: nil)
      end
    end
  end

end
