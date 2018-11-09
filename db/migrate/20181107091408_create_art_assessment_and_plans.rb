class CreateArtAssessmentAndPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :art_assessment_and_plans do |t|
      t.date :date
      t.references :art_patient, foreign_key: true
      t.jsonb :ARV_eleigibility_criteria
      t.jsonb :plan

      t.timestamps
    end
  end
end
