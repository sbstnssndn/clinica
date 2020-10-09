class SingleChoiceField < FormField
  # No tiene sentido asignar min y max
  validates :max,
            :min,
            absence: { message: "can't be specified on text field" }

  # No se hace ninguna validación
  def add_validation_errors(value); end

end