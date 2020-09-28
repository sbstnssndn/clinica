class FormValue < ApplicationRecord
  belongs_to :form_field
  belongs_to :submittable, polymorphic: true, dependent: :destroy
end
