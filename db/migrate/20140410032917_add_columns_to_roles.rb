class AddColumnsToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :user_id, :integer
    add_column :roles, :semester_id, :integer
    add_column :roles, :position_id, :integer
  end
end
