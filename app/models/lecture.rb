class Lecture < ActiveRecord::Base

  Lecture.all.group_by(&:year).map{|year, lectures| { year => lectures.group_by{|l| l.semester}}}

  def filename
    "lectures/#{year}/#{semester.downcase}/#{partial.downcase}"
  end

  class << self

    def by_year_and_semester
      all.group_by(&:year).map{|year, lectures| {year => lectures.group_by{|lecture| lecture.semester}}}
    end

  end

end
