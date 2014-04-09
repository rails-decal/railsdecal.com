class Lecture < ActiveRecord::Base
  belongs_to :semester

  default_scope order(:number)

  def filename
    "lectures/#{year}/#{semester.downcase}/#{partial.downcase}"
  end

  class << self

    def by_year_and_semester
      all.group_by(&:year).map{|year, lectures| {year => lectures.group_by{|lecture| lecture.semester}}}
    end

  end

end
