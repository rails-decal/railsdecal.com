class ReplaceSidWithBigInt < ActiveRecord::Migration
  def change
    add_column :users, :student_id_big, :bigint
    User.all.each do |user|
      user.update_attribute(:student_id_big, user.student_id)
    end
    remove_column :users, :student_id
    rename_column :users, :student_id_big, :student_id
  end
end
