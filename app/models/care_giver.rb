class CareGiver < ApplicationRecord
  belongs_to :art_patient
  belongs_to :organization_structure
end
