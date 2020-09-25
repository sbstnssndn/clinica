class AddUserReferenceToFormValue < ActiveRecord::Migration[5.2]
  def change
    add_reference :form_values, :user, foreign_key: true
  end
end
