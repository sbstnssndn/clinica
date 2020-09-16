# name: string
# certification: string
# kind: integer
class ExamBattery < ApplicationRecord
  enum kind: { general: 0, business: 1 }
  has_many :exam_associations
  has_many :exams, through: :exam_associations

  has_many :battery_selections
  has_many :appointments, through: :battery_selections

  accepts_nested_attributes_for :exam_associations, allow_destroy: true
end
