class AddSemestertoStudentApplication < ActiveRecord::Migration
  def change
    add_column :student_applications, :semester_id, :integer
  end
end
