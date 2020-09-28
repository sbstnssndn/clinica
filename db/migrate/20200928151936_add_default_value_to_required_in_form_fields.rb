class AddDefaultValueToRequiredInFormFields < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:form_fields, :required, from: nil, to: false)
    FormField.all.each do |ff|
      if ff.required.nil?
        ff.update!(required: false)
      end
    end
  end
end
