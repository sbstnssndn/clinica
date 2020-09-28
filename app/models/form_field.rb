class FormField < ApplicationRecord
  belongs_to :formable, polymorphic: true

  validates :type, presence: true
  validates :label, presence: true

  def show_type
    fail NotImplementedError
  end
end
