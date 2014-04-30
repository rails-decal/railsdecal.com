class StudentApplicationsController < ApplicationController
  load_and_authorize_resource

  def new
    @student_application = StudentApplication.new
  end

  def create
    @student_application = StudentApplication.new(student_application_params)
    @student_application.user = current_user
    @student_application.semester = Semester.current
    if @student_application.save
      flash[:info] = "Thanks for applying! We'll get back to you with our decision."
      redirect_to why_path
    else
      flash[:danger] = "There was an error submitting your application. Please fix it and try again."
      render 'new'
    end
  end

  private

  def student_application_params
    params.require(:student_application).permit(
      :first_name, :last_name, :email, :year,
      :major, :why_join, :cs_classes_taken, :current_courseload,
      :other_commitments, :how_many_hours_willing, :how_did_you_hear_about_us
    )
  end

end
