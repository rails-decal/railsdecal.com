class ChangeSidToBigInt < ActiveRecord::Migration
  def change
    change_column :users, :student_id, :bigint
  end
end
