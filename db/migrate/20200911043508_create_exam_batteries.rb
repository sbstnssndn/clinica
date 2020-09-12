class CreateExamBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_batteries do |t|
      t.string :name
      t.string :certification
      t.integer :kind

      t.timestamps
    end
  end
end
