class CreateExamResults < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_results do |t|
      t.references :exam, foreign_key: true
      t.boolean :verified

      t.timestamps
    end
  end
end
