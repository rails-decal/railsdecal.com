class Lecture < ActiveRecord::Base
  belongs_to :semester

  default_scope order(:number)

  def year
    semester.year
  end

  def semester_name
    semester.semester
  end

  def filename
    "lectures/#{year}/#{semester_name.downcase}/#{partial.downcase}"
  end

  class << self

    def by_year_and_semester
      all.group_by(&:semester).map{|semester, lectures| {semester.year => lectures.group_by{|lecture| semester.semester}}}
    end

  end

end
