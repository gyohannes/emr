class CreateArtPatients < ActiveRecord::Migration[5.1]
  def change
    create_table :art_patients do |t|
      t.references :patient, foreign_key: true
      t.date :enrollment_date
      t.string :unique_art_number
      t.string :target_population_category
      t.jsonb :mother_full_name
      t.string :place_of_delivery
      t.string :mode_of_delivery
      t.string :care_giver_marital_status

      t.timestamps
    end
  end
end
