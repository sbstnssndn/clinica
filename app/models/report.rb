class Report < ApplicationRecord
  include Submittable

  validates_presence_of :patient
  # validate :report_not_completed, on: :update

  belongs_to :patient
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
        battery.exams.map do |e|
          temp[:exams] << e
        end
      else
        battery.exams.each do |exam|
          exam_already_added = false
          result.each do |jash|
            exam_already_added = true if jash[:exams].include?(exam)
          end
          temp[:exams] << exam unless exam_already_added
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

  def exam_selections
    ExamSelection.where(battery: appointment.batteries)
  end

  def create_fields
    appointment.batteries.each do |battery|
      ExamSelection.where(battery: battery).each do |selection|
        # cada selection identifica a un examen de la batería
        selection.exam.form_fields.each do |field|
          form_values.create!(
            form_field: field,
            value: nil,
            data: { battery: battery.name, exam: selection.exam.name }
          )
        end
      end
    end
  end

  def complete
    self.completed = true
    self.snapshot = generate_snapshot
    save ? true : false
  end

  def generate_snapshot
    full_report = { created_at: Time.now, batteries: [] }
    batteries_with_exams.each do |element|
      battery = element[:battery]
      new_battery = { name: battery.name, exams: [] }
      element[:exams].each do |exam|
        new_exam = { name: exam.name, fields: [] }
        exam.form_fields.each do |field|
          new_field = {
            label: field.label,
            required: field.required,
            type: field.type,
            min: field.min,
            max: field.max,
            value: FormValue.find_by(form_field: field).try(:value)
          }
          new_exam[:fields] << new_field
        end
        new_battery[:exams] << new_exam
      end
      full_report[:batteries] << new_battery
    end
    full_report
  end

  def create_form_values!
    exams.each do |exam|
      exam.form_fields.each do |field|
        form_values.create!(form_field: field, value: nil)
      end
    end
  end

  private

  def report_not_completed
    if self.completed? && self.snapshot.present?
      errors[:base] << 'No se puede editar un informe completado.'
    end
  end

end
