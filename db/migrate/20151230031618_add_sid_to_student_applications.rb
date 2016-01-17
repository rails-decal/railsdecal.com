class AddSidToStudentApplications < ActiveRecord::Migration
  def change
    add_column :student_applications, :sid, :integer
  end
end
