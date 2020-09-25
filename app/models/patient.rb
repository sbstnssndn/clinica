class Patient < ApplicationRecord
  belongs_to :appointment

  has_many :exam_results
  has_many :exams, through: :exam_results
end
