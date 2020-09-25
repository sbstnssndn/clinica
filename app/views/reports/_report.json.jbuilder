json.extract! report, :id, :appointment_id, :patient_id, :completed, :created_at, :updated_at
json.url report_url(report, format: :json)
