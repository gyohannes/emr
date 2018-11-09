class Referral < ApplicationRecord
  belongs_to :art_patient
  belongs_to :department, optional: true
end
