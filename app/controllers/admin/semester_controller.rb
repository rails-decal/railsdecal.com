class Admin::SemesterController < ApplicationController
  def new
  	@semester = Semester.new
  end

  def create
  	@semester = Semester.new(semester_params)
  	if @semester.save
  	  flash[:info] = "Created semester."
  	  current_user.add_role_for_semester(Role::INSTRUCTOR, @semester)
  	  redirect_to admin_semester_path(@semester)
  	else
  	  flash[:error] = "Problem creating semester."
  	  render "new"
    end
  end

  def show
  	@semester = Semester.find(params[:id])
  end

  private

  def semester_params
    params.require(:semester).permit(:semester, :year, :lower_division_limit, :upper_division_limit, :application_deadline, :acceptance_release_date)
  end
end
