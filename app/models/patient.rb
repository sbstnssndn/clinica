class Patient < ApplicationRecord
  belongs_to :appointment
  has_many :reports
end
