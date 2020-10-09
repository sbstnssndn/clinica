class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :label
      t.string :value
      t.belongs_to :form_field, foreign_key: true

      t.timestamps
    end
  end
end
