json.extract! patient, :id, :MRN, :first_name, :father_name, :grand_father_name, :mother_first_name, :gender, :date_of_birth, :religion, :education_level, :occupation, :marital_status, :organization_structure_id, :kebele, :house_number, :home_telephone, :mobile_phone, :created_at, :updated_at
json.url patient_url(patient, format: :json)
