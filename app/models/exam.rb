# Attributes
# name: string
class Exam < ApplicationRecord
  has_many :exam_associations
  has_many :exam_batteries, through: :exam_associations

  accepts_nested_attributes_for :exam_associations, allow_destroy: true
end
