class RemoveYearAndSemesterFromLectures < ActiveRecord::Migration
  def change
    remove_column :lectures, :year
    remove_column :lectures, :semester
  end
end
