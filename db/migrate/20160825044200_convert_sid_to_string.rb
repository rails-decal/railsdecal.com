class ConvertSidToString < ActiveRecord::Migration
  def change
    add_column :users, :student_id_str, :string
    User.all.each do |user|
      user.update_attribute(:student_id_str, user.student_id.to_s)
    end
    remove_column :users, :student_id
    rename_column :users, :student_id_str, :student_id
  end
end
