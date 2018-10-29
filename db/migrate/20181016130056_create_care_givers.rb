class CreateCareGivers < ActiveRecord::Migration[5.1]
  def change
    create_table :care_givers do |t|
      t.references :art_patient, foreign_key: true
      t.string :full_name
      t.integer :age
      t.string :gender
      t.string :relation
      t.boolean :address_same_as_patient
      t.references :organization_structure, foreign_key: true
      t.string :kebele
      t.string :house_number
      t.jsonb :telephones

      t.timestamps
    end
  end
end
