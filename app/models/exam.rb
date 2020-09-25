class Exam < ApplicationRecord
  has_many :exam_selections
  has_many :batteries, through: :exam_selections
  validates_uniqueness_of :name

  has_many :form_fields
  accepts_nested_attributes_for :form_fields, allow_destroy: true
end
