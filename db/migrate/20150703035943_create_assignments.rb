class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :semester, index: true
      t.string :link
      t.integer :category, default: 0
      t.float :weight, default: 1
      t.integer :points
      t.datetime :deadline

      t.timestamps null: false
    end
    add_foreign_key :assignments, :semesters
  end
end
