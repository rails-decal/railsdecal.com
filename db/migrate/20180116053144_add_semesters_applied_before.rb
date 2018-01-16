class AddSemestersAppliedBefore < ActiveRecord::Migration
  def change
  	add_column :student_applications, :semesters_applied_before, :text
  end
end
