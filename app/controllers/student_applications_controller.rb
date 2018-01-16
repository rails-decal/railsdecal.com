class StudentApplicationsController < ApplicationController
  load_and_authorize_resource

  def new
    @student_application = StudentApplication.new
  end

  def create
    @student_application = StudentApplication.new(student_application_params)
    @student_application.user = current_user
    @student_application.semester = Semester.current
    if @student_application.save_and_update_user
      flash[:info] = "Thanks for applying! We will get back to you as soon as possible."
      #ApplicationSubmissionMailer.delay.send_confirmation(@student_application.id) patch fix mailer.
      redirect_to why_path
    else
      flash[:danger] = "There was an error submitting your application. Please fix it and try again."
      render 'new'
    end
  end

  private

  def student_application_params
    params.require(:student_application).permit(
      :first_name, :last_name, :email, :student_id, :year, :standing,
      :major, :why_join, :cs_classes_taken, :current_courseload,
      :other_commitments, :how_many_hours_willing, :how_did_you_hear_about_us,
      :semesters_applied_before
    )
  end

end
