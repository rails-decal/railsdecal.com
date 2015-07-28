class AddEnrollmentLimitsToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :lower_division_limit, :integer
    add_column :semesters, :upper_division_limit, :integer
  end
end
