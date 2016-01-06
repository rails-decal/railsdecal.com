class AddApprovedToAbsences < ActiveRecord::Migration
  def change
    add_column :absences, :approved, :integer, default: 0
  end
end
