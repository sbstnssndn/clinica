class RemoveExamIdFromFormFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :form_fields, :exam_id
  end
end
