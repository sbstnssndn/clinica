class FormField < ApplicationRecord
  belongs_to :exam

  def show_type
    fail NotImplementedError
  end
end
