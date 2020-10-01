class AddDataToFormValues < ActiveRecord::Migration[5.2]
  def change
    add_column :form_values, :data, :jsonb
  end
end
