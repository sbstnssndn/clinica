class Branch < ApplicationRecord
  has_many :battery_offerings
  has_many :batteries, through: :battery_offerings

  has_one :account
end
