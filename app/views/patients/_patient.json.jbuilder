json.extract! patient, :id, :name, :rut, :birthday, :created_at, :updated_at
json.url patient_url(patient, format: :json)
