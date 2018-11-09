class CreateMedicalHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_histories do |t|
      t.date :date
      t.references :art_patient, foreign_key: true
      t.string :past_opportunistic_illness, array: true
      t.jsonb :tb
      t.jsonb :hiv
      t.jsonb :medications
      t.string :known_drug_allergies, array: true

      t.timestamps
    end
  end
end
