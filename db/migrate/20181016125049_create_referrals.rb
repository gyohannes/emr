class CreateReferrals < ActiveRecord::Migration[5.1]
  def change
    create_table :referrals do |t|
      t.references :art_patient, foreign_key: true
      t.string :referred_from
      t.references :department, foreign_key: true
      t.string :outside_referral_type

      t.timestamps
    end
  end
end
