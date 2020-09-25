class CreateFormFields < ActiveRecord::Migration[5.2]
  def change
    create_table :form_fields do |t|
      t.integer :min
      t.integer :max
      t.boolean :required
      t.string :label
      t.string :type

      t.timestamps
    end
  end
end
