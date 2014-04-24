class StudentApplicationsController < ApplicationController
  before_filter :student_application, only: [:show]
  before_action :admin_user

  def new
    if enabled_user?
      @student_application = StudentApplication.new
    else
      redirect_to why_path
    end
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

  def index
    @student_applications = StudentApplication.all
  end

  def show
    @evaluation = @student_application.evaluations.find_by_user_id(current_user.id) || @student_application.evaluations.build
  end

  private

  def student_application
    @student_application = StudentApplication.find(params[:id])
  end

  def student_application_params
    params.require(:student_application).permit(
      :first_name, :last_name, :email, :year,
      :major, :why_join, :cs_classes_taken, :current_courseload,
      :other_commitments, :how_many_hours_willing, :how_did_you_hear_about_us
    )
  end

end
