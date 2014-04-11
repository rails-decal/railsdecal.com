class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :image_url, :string
    add_column :users, :bio, :text
    add_column :users, :blog, :string
    add_column :users, :location, :string
  end
end
