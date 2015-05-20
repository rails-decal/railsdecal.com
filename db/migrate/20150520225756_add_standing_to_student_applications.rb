class AddStandingToStudentApplications < ActiveRecord::Migration
  def change
    add_column :student_applications, :standing, :integer, default: 0
  end
end
