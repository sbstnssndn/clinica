class Battery < ApplicationRecord
  has_many :exam_selections, dependent: :destroy
  has_many :exams, through: :exam_selections

  has_many :appointment_batteries, dependent: :destroy
  has_many :appointments, through: :appointment_batteries, dependent: :destroy

  has_many :battery_offerings, dependent: :destroy
  has_many :branches, through: :battery_offerings

  accepts_nested_attributes_for :exams
  accepts_nested_attributes_for :exam_selections
  accepts_nested_attributes_for :battery_offerings

  validates_uniqueness_of :name

  def self.next_order
    return 1 if Battery.all.empty?
    Battery.all.order(:order).last.order + 1
  end
end
