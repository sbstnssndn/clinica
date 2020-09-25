class AddReportReferenceToFormValues < ActiveRecord::Migration[5.2]
  def change
    add_reference :form_values, :report, foreign_key: true
  end
end
