class GeneralCondition < ApplicationRecord
  belongs_to :art_patient
  has_many :physical_exams

  accepts_nested_attributes_for :physical_exams

end
