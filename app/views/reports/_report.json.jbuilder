json.extract! report, :id, :completed, :patient_id, :conclusions, :created_at, :updated_at
json.url report_url(report, format: :json)
