class Admin::EvaluationsController < Admin::BaseController

  def create
    @student_application = StudentApplication.find(params[:student_application_id])
    @evaluation = Evaluation.find_by_user_id_and_student_application_id(current_user.id, @student_application.id) || Evaluation.new(evaluation_params)
    @evaluation.update(evaluation_params)
    @evaluation.student_application = @student_application
    @evaluation.user = current_user
    if @evaluation.save
      if @student_application.next.nil?
        redirect_to admin_student_applications_path
      else
        redirect_to admin_student_application_path(@student_application.next)
      end
    else
      redirect_to admin_student_application_path(@student_applicaiton)
    end
  end

  def index
    @semester = Semester.current
    @applications = StudentApplication.all
    @users = User.current_staff
  end

  private
    def evaluation_params
      params.require(:evaluation).permit(:decision, :comment, :application_id)
    end
end
