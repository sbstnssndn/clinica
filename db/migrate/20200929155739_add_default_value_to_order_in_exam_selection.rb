class AddDefaultValueToOrderInExamSelection < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:exam_selections, :order, from: nil, to: 1)
    ExamSelection.where(order: nil).update_all(order: 1)
  end
end
