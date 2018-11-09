class CreatePhysicalExams < ActiveRecord::Migration[5.1]
  def change
    create_table :physical_exams do |t|
      t.references :general_condition, foreign_key: true
      t.string :physical_exam
      t.boolean :status
      t.text :abnormal_findings

      t.timestamps
    end
  end
end
