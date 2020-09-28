class RemoveReportIdFromFormValues < ActiveRecord::Migration[5.2]
  def change
    remove_column :form_values, :report_id
  end
end
