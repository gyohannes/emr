class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.references :facility, foreign_key: true
      t.string :mrn
      t.string :first_name
      t.string :father_name
      t.string :grand_father_name
      t.string :gender
      t.date :date_of_birth
      t.jsonb :age
      t.string :mother_first_name
      t.string :religion
      t.string :education_level
      t.string :occupation
      t.string :marital_status
      ### Address
      t.references :organization_structure, foreign_key: true
      t.string :residence_type
      t.string :kebele
      t.string :house_number
      t.jsonb :telephones
      t.boolean :catchment_area
      t.boolean :followup_challenge
      ###
      t.timestamps
    end
  end
end
