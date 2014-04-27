class Admin::StudentApplicationsController < Admin::BaseController
  before_filter :student_applications, only: [:index]
  before_filter :student_application, only: [:show]

  def index
  end

  def show
    @evaluation = @student_application.evaluations.find_by_user_id(current_user.id) || @student_application.evaluations.build
  end

  private

  def student_applications
    @student_applications = StudentApplication.all
  end

  def student_application
    @student_application = StudentApplication.find(params[:id])
  end

end