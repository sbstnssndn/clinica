class CreateFormFields < ActiveRecord::Migration[5.2]
  def change
    create_table :form_fields do |t|
      t.string :label
      t.boolean :required
      t.string :type

      t.timestamps
    end
  end
end
