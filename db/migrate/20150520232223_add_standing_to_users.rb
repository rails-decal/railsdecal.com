class AddStandingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :standing, :integer, default: 0
  end
end
