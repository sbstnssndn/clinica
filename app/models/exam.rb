class Exam < ApplicationRecord
  has_many :exam_selections
  has_many :batteries, through: :exam_selections

  validates_uniqueness_of :name
end
