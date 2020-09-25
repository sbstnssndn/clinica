class AddReportReferenceToResults < ActiveRecord::Migration[5.2]
  def change
    add_reference :results, :report, foreign_key: true
  end
end
