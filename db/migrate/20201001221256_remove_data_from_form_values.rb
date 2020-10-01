class RemoveDataFromFormValues < ActiveRecord::Migration[5.2]
  def change
    remove_column :form_values, :data, :jsonb
  end
end
