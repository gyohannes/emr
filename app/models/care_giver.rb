class CareGiver < ApplicationRecord
  belongs_to :art_patient
  belongs_to :organization_structure
  store_accessor :telephones, :home_telephone, :mobile_telephone, :work_telephone
end
