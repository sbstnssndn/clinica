class AddExamReferenceToFormField < ActiveRecord::Migration[5.2]
  def change
    add_reference :form_fields, :exam, foreign_key: true
  end
end
