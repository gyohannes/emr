class CreateGeneralConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :general_conditions do |t|
      t.date :date
      t.references :art_patient, foreign_key: true
      t.jsonb :vital_signs_anrtopometry_and_functional_level
      t.string :symptom_screen
      t.jsonb :pregnancy_status
      t.text :general_appearance
      t.text :other_findings

      t.timestamps
    end
  end
end
