class AssignmentSubmissionsController < ApplicationController
  def create
    if AssignmentSubmission.create assignment_submission_params
      flash[:success] = 'Successfully submitted assignment'
    else
      flash[:error] = 'An error occured while submitting your assignment'
    end
    redirect_to :assignments_path
  end

  private
  def assignment_submission_params
    params.require(:assignment_submission).permit(:assignment_id, :link)
  end
end
