# columns: label, required, min, max, type
class FormField < ApplicationRecord
  has_one :form_value

  validates :type, presence: true

  def validate_value(form_value)
    form_value.errors.add :value, "can't be blank" if required? && form_value.value.blank?

    add_validation_errors(form_value)
    form_value
  end

  def add_validation_errors(_)
    fail NotImplementedError
  end

  def required?
    required
  end
end
