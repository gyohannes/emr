class CreateSocialAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :social_assessments do |t|
      t.date :date
      t.references :art_patient, foreign_key: true
      t.jsonb :employment
      t.jsonb :living_condition
      t.jsonb :supportive_care
      t.jsonb :disclosure
      t.jsonb :family_members
      t.string :issues, array: true

      t.timestamps
    end
  end
end
