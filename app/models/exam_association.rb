class ExamAssociation < ApplicationRecord
  belongs_to :exam
  belongs_to :exam_battery
end
