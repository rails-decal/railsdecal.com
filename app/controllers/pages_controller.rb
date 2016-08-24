class PagesController < ApplicationController

  def home
    @info = Semester.current.info + " Instructors: "
    @check_in = CheckIn.new
  end

  def why
  end

  def office_hours
  end

end
