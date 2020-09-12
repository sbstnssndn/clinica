class CreateJoinTableExamsExamBatteries < ActiveRecord::Migration[5.2]
  def change
    create_join_table :exams, :exam_batteries do |t|
      # t.index [:exam_id, :exam_battery_id]
      # t.index [:exam_battery_id, :exam_id]
    end
  end
end
