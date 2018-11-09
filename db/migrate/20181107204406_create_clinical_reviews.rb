class CreateClinicalReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :clinical_reviews do |t|
      t.date :date
      t.references :art_patient, foreign_key: true
      t.jsonb :who_staging
      t.jsonb :clinical_review

      t.timestamps
    end
  end
end
