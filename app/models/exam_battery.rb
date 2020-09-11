# name: string
# certification: string
# kind: integer
class ExamBattery < ApplicationRecord
  enum kind: { general: 0, business: 1 }
  has_and_belongs_to_many :exams
end
