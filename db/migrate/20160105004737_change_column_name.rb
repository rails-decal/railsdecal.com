class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :student_applications, :sid, :student_id
  	rename_column :users, :sid, :student_id
  end
end
