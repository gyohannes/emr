class ArtPatient < ApplicationRecord
  belongs_to :patient, optional: true
  has_many :dependents, dependent: :destroy
  has_one :referral, dependent: :destroy
  has_one :care_giver, dependent: :destroy

  accepts_nested_attributes_for :patient, allow_destroy: true
  accepts_nested_attributes_for :dependents, allow_destroy: true,
                                :reject_if => proc { |att| att['name'].blank? and att['relation'].blank? and att['age'].blank? }
  accepts_nested_attributes_for :referral
  accepts_nested_attributes_for :care_giver

end
