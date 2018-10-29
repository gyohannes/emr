class CreateRelatives < ActiveRecord::Migration[5.1]
  def change
    create_table :relatives do |t|
      t.references :patient, foreign_key: true
      t.string :name
      t.string :relationship
      t.string :phone

      t.timestamps
    end
  end
end
