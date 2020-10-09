class Exam < ApplicationRecord
  include Formable

  has_many :exam_selections, dependent: :destroy
  has_many :batteries, through: :exam_selections
  validates_uniqueness_of :name


  def battery_relations_except(battery_ids)
    ExamSelection
      .where(exam: self)
      .where
      .not(battery_id: battery_ids)
  end
end
