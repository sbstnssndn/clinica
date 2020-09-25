class Indicator < ApplicationRecord
  belongs_to :exam
  has_many :results
end
