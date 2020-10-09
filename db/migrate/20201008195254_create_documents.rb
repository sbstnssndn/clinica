class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.text :description
      t.references :form_value, foreign_key: true

      t.timestamps
    end
  end
end
