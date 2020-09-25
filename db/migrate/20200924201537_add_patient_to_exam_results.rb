class AddPatientToExamResults < ActiveRecord::Migration[5.2]
  def change
    add_reference :exam_results, :patient, foreign_key: true
  end
end
