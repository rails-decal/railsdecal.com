class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.text :decision
      t.references :user, index: true
      t.references :student_application, index: true
      t.text :comment

      t.timestamps
    end
  end
end
