class AddSubmittableToFormValues < ActiveRecord::Migration[5.2]
  def change
    add_column :form_values, :submittable_id, :integer
    add_column :form_values, :submittable_type, :string
  end
end
