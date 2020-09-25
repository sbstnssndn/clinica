json.extract! patient, :id, :name, :rut, :phone, :created_at, :updated_at
json.url patient_url(patient, format: :json)
