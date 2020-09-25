class AddUniqueIndexToExamSelections < ActiveRecord::Migration[5.2]
  def change
    add_index :exam_selections, [:exam_id, :battery_id], unique: true
  end
end
