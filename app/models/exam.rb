# Attributes
# name: string
class Exam < ApplicationRecord
  # include Formable
  has_many :form_fields
  accepts_nested_attributes_for :form_fields, allow_destroy: true

  has_many :exam_associations
  has_many :exam_batteries, through: :exam_associations

  accepts_nested_attributes_for :exam_associations, allow_destroy: true

  # has_many :results, class_name: 'ExamResult'
  has_many :exam_results
  has_many :patients, through: :exam_results
end
