json.extract! art_patient, :id, :patient_id, :enrollment_date, :unique_art_number, :target_population_category, :mother_full_name, :place_of_delivery, :mode_of_delivery, :care_giver_marital_status, :created_at, :updated_at
json.url art_patient_url(art_patient, format: :json)
