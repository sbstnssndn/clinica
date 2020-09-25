class Battery < ApplicationRecord
  has_many :exam_selections
  has_many :exams, through: :exam_selections

  validates_uniqueness_of :name
end
