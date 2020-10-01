class AddSnapshotToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :snapshot, :jsonb
  end
end
