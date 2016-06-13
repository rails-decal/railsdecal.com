class PagesController < ApplicationController

  def home
    @info = Semester.current.info + " Instructor: "
    @check_in = CheckIn.new
  end

  def why
  end

  def office_hours
  end

end
