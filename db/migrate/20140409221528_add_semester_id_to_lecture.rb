class AddSemesterIdToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :semester_id, :integer
  end
end
