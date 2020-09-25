class TextField < FormField
  # min and max don’t make sense on a text field, so disallow them
  validates :max,
            :min,
            absence: { message: "can't be specified on text field" }

  # no additional validations required for text field
  def add_validation_errors(value); end
end