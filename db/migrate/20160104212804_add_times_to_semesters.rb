class AddTimesToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :day_of_week, :integer
    add_column :semesters, :start_time, :string
    add_column :semesters, :end_time, :string
    add_column :semesters, :location, :string
  end
end
