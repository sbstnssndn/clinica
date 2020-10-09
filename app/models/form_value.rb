class FormValue < ApplicationRecord
  belongs_to :form_field
  belongs_to :submittable, polymorphic: true

  validate :value_is_valid, on: :update

  has_many :documents
  accepts_nested_attributes_for :documents

  def documents_attributes=(array = [])
    array.each do |_, documents_attributes_array|
      documents_attributes_array[:document].each do |document|
        documents.create(
          document: document,
          description: documents_attributes_array[:description]
        )
      end
    end
  end

  private

  def value_is_valid
    form_field.validate_value(self)
  end
end
