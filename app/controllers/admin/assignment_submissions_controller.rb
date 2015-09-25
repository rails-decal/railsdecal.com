class Admin::AssignmentSubmissionsController < Admin::BaseController
  load_and_authorize_resource

  def show
    @assignment = @assignment_submission.assignment
  end

  def update
    @assignment_submission.update assignment_params
    redirect_to admin_assignments_path
  end

  private

  def assignment_params
    params.require(:assignment_submission).permit(:points).merge grader: current_user
  end
end
