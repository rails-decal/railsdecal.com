class CreateAssignmentSubmissions < ActiveRecord::Migration
  def change
    create_table :assignment_submissions do |t|
      t.references :user, index: true
      t.references :assignment, index: true
      t.integer :points
      t.datetime :time_submitted
      t.integer :grader_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :assignment_submissions, :users
    add_foreign_key :assignment_submissions, :assignments
  end
end
