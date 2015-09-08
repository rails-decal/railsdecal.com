class AssignmentSubmissionsController < ApplicationController
  def create
    assignment_submission = AssignmentSubmission.new assignment_submission_params_with_user
    if assignment_submission.save
      flash[:success] = 'Successfully submitted assignment'
    else
      flash[:error] = 'An error occured while submitting your assignment'
    end
    redirect_to assignments_path(assignment_submission.assignment.id)
  end

  def update
    assignment_submission = AssignmentSubmission.find(params[:id])
    if assignment_submission.update(assignment_submission_params)
      flash[:success] = 'Successfully updated assignment'
    else
      flash[:error] = 'An error occured while updating your submission'
    end
    redirect_to assignments_path(assignment_submission.assignment.id)
  end

  private
  def assignment_submission_params
    params.require(:assignment_submission).permit(:assignment_id, :link)
  end

  def assignment_submission_params_with_user
    assignment_submission_params.merge user_id: current_user.id
  end
end
