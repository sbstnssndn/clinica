class Document < ApplicationRecord
  belongs_to :form_value

  has_attached_file              :document
  # TODO: Agregar MIME Type para PDF y weás
  validates_attachment_file_name :document, matches: [/\.xls/, /\.xlsx?$/, /\.csv?$/, /\.zip?$/, /\.jpg?$/, /\.jpeg?$/, /\.png?$/, /\.gif?$/, /\.pdf?$/, /\.doc?$/, /\.docx?$/, /\.ppt?$/, /\.pptx?$/], allow_nil: true
  validates_attachment_size      :document, less_than: 25.megabytes
end
