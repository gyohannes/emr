class CreateTbs < ActiveRecord::Migration[5.1]
  def change
    create_table :tbs do |t|
      t.references :medical_history, foreign_key: true
      t.jsonb :tb_smear
      t.jsonb :tb_tx
      t.jsonb :post_treatment_smear

      t.timestamps
    end
  end
end
