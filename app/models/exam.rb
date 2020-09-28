class Exam < ApplicationRecord
  has_many :exam_selections
  has_many :batteries, through: :exam_selections
  validates_uniqueness_of :name

  has_many :form_fields
  accepts_nested_attributes_for :form_fields, allow_destroy: true

  def battery_relations_except(battery_ids)
    ExamSelection
      .where(exam: self)
      .where
      .not(battery_id: battery_ids)
  end
end
