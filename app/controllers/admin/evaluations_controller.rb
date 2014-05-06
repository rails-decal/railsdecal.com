class Admin::EvaluationsController < Admin::BaseController
  before_filter :semester

  def create
    @student_application = StudentApplication.find(params[:id])
    @evaluation = Evaluation.find_by_user_id_and_student_application_id(current_user.id, @student_application.id) || Evaluation.new(evaluation_params)
    @evaluation.update(evaluation_params)
    @evaluation.student_application = @student_application
    @evaluation.user = current_user
    if @evaluation.save
      if @student_application.next.nil?
        redirect_to admin_student_applications_path(semester_url: @semester.url)
      else
        redirect_to admin_student_application_path(semester_url: @semester.url, id: @student_application.next.id)
      end
    else
      redirect_to admin_student_application_path(semester_url: @semester.url, id: @student_applicaiton.id)
    end
  end

  def index
    @applications = StudentApplication.all
    @users = User.current_staff
  end

  private

  def semester
    @semester = Semester.find_by(url: params[:semester_url])
  end

  def evaluation_params
    params.require(:evaluation).permit(:decision, :comment, :application_id)
  end

end
