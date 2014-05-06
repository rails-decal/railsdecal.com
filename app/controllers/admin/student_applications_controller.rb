class Admin::StudentApplicationsController < Admin::BaseController
  before_filter :semester
  before_filter :student_applications, only: [:index]
  before_filter :student_application, only: [:show]

  def index
  end

  def show
    evaluations = @student_application.evaluations
    @evaluation = evaluations.find_by_user_id(current_user.id) || evaluations.build
  end

  private

  def student_applications
    @student_applications = StudentApplication.where(semester: @semester)
  end

  def student_application
    @student_application = StudentApplication.find(params[:id])
  end

  def semester
    @semester = Semester.find_by(url: params[:semester_url])
  end

end
