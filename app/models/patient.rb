class Patient < ApplicationRecord
  belongs_to :organization_structure
  has_one :art_patient
  has_many :relatives, dependent: :destroy
  store_accessor :telephones, :home_telephone, :mobile_telephone, :work_telephone
  store_accessor :age, :years, :months, :days

  validates :first_name, :father_name, :grand_father_name, presence: true

  after_create :set_mrn

  scope :list_by_mrn, -> (mrn) { mrn.blank? ? [] : where("mrn LIKE ?", "#{mrn}%")}
  scope :list_by_art_number, -> (art_number) { art_number.blank? ? [] : joins(:art_patient).where("unique_art_number LIKE ?", "#{art_number}%")}
  scope :list_by_first_name, -> (first_name) { first_name.blank? ? [] : where("lower(first_name) LIKE ?", "#{first_name.downcase}%")}
  scope :list_by_father_name, -> (father_name) { father_name.blank? ? [] : where("lower(father_name) LIKE ?", "#{father_name.downcase}%")}
  scope :list_by_grand_father_name, -> (grand_father_name) { grand_father_name.blank? ? [] : where("lower(grand_father_name) LIKE ?", "#{grand_father_name.downcase}%")}
  scope :list_by_phone, -> (phone) { phone.blank? ? [] : where("telephones ->> 'mobile_telephone' LIKE ?", "#{phone}%")}
  scope :list_by_gender, -> (gender) { gender.blank? ? [] : where("gender LIKE ?", "#{gender}%")}

  def set_mrn
    mrn = id.to_s
    while mrn.length < 4
      mrn = '0' << mrn
    end
    update(mrn: mrn)
  end

  def self.search(mrn, art_number, phone_number, age, gender, first_name, father_name, grand_father_name)
    return (list_by_mrn(mrn) + list_by_art_number(art_number) + list_by_first_name(first_name) +
        list_by_father_name(father_name) + list_by_grand_father_name(grand_father_name) +
        list_by_gender(gender) + list_by_phone(phone_number)).uniq
  end

end
