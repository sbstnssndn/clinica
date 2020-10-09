class FormField < ApplicationRecord
  belongs_to :formable, polymorphic: true

  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true

  enum length: { long: 0, medium: 1, short: 2 }

  validates :type, presence: true
  validates :label, presence: true

  def validate_value(form_value)
    form_value.errors.add :value, "can't be blank" if required? && form_value.value.blank?

    add_validation_errors(form_value)
    form_value
  end

  # No se puede validar esta clase, ya que es como una interfaz, no se debería
  # instanciar como un campo utilizable.
  def add_validation_errors(_)
    fail NotImplementedError
  end

end
