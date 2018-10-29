class CreateDependents < ActiveRecord::Migration[5.1]
  def change
    create_table :dependents do |t|
      t.references :art_patient, foreign_key: true
      t.string :name
      t.string :relation
      t.integer :age
      t.string :health_status

      t.timestamps
    end
  end
end
