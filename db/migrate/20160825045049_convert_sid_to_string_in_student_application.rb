class ConvertSidToStringInStudentApplication < ActiveRecord::Migration
  def change
    add_column :student_applications, :student_id_str, :string
    StudentApplication.all.each do |student_application|
      student_application.update_attribute(:student_id_str, student_application.student_id.to_s)
    end
    remove_column :student_applications, :student_id
    rename_column :student_applications, :student_id_str, :student_id
  end
end
