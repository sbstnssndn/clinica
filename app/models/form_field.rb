class FormField < ApplicationRecord
  belongs_to :exam

  validates :type, presence: true
  validates :label, presence: true

  def show_type
    fail NotImplementedError
  end
end
