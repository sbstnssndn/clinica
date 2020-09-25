class ExamResult < ApplicationRecord
  # include Submittable
  has_many :form_values, as: :submittable
  # accepts_nested_attributes_for :form_values, allow_destroy: true

  belongs_to :exam
  belongs_to :patient
end
