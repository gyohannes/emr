class CreateHivs < ActiveRecord::Migration[5.1]
  def change
    create_table :hivs do |t|
      t.references :medical_history, foreign_key: true
      t.jsonb :hiv_test
      t.jsonb :arv_rx
      t.jsonb :pmtct
      t.jsonb :cd4

      t.timestamps
    end
  end
end
