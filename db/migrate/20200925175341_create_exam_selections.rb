class CreateExamSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_selections do |t|
      t.integer :order
      t.references :exam, foreign_key: true
      t.references :battery, foreign_key: true

      t.timestamps
    end
  end
end
