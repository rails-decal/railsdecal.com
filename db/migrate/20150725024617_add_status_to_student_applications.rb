class AddStatusToStudentApplications < ActiveRecord::Migration
  def change
    add_column :student_applications, :status, :integer, default: 0
  end
end
