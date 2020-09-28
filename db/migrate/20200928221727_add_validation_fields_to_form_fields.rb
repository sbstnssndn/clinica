class AddValidationFieldsToFormFields < ActiveRecord::Migration[5.2]
  def change
    add_column :form_fields, :min, :integer
    add_column :form_fields, :max, :integer
  end
end
