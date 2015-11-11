class AddSidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sid, :integer
  end
end
