class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user, index: true
      t.references :semester, index: true
      t.string :link
      t.float :weight
      t.integer :points
      t.datetime :deadline

      t.timestamps null: false
    end
    add_foreign_key :assignments, :users
    add_foreign_key :assignments, :semesters
  end
end
