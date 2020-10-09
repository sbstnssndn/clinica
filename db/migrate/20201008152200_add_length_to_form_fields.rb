class AddLengthToFormFields < ActiveRecord::Migration[5.2]
  def change
    add_column :form_fields, :length, :integer, default: :long
  end
end
