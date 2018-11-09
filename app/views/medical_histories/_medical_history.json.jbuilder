json.extract! medical_history, :id, :art_patient_id, :past_opportunistic_illness, :medications, :known_drug_allergies, :created_at, :updated_at
json.url medical_history_url(medical_history, format: :json)
