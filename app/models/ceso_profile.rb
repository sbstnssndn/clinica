class CesoProfile < ApplicationRecord
  has_one :user, as: :profile, dependent: :destroy
  belongs_to :branch
end
