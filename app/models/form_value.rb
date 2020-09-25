class FormValue < ApplicationRecord
  belongs_to :form_field
  belongs_to :report
end
