class RemoveTimeSubmittedFromAbsences < ActiveRecord::Migration
  def change
    remove_column :absences, :time_submitted, :datetime
  end
end
