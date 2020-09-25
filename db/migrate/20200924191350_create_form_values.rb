class CreateFormValues < ActiveRecord::Migration[5.2]
  def change
    create_table :form_values do |t|
      t.text :value
      t.belongs_to :form_field, foreign_key: true

      t.timestamps
    end
  end
end
