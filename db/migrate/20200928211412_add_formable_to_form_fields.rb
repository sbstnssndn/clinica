class AddFormableToFormFields < ActiveRecord::Migration[5.2]
  def change
    add_column :form_fields, :formable_id, :integer
    add_column :form_fields, :formable_type, :string
  end
end
