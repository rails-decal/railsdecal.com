class AddFieldsToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :application_deadline, :datetime
    add_column :semesters, :acceptance_release_date, :datetime
  end
end
