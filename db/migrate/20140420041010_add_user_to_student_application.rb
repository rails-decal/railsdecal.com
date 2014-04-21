class AddUserToStudentApplication < ActiveRecord::Migration
  def change
    add_column :student_applications, :user_id, :integer
  end
end
