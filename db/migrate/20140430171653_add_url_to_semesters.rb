class AddUrlToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :url, :string
  end
end
