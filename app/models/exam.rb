# Attributes
# name: string
class Exam < ApplicationRecord
  has_and_belongs_to_many :exam_batteries
end
