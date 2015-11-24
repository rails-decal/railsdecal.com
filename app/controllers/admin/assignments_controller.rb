class Admin::AssignmentsController < Admin::BaseController
  def index
    @assignments = Semester.current.assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
    @assignment_submissions = @assignment.assignment_submissions.order(grader_id: :desc)
  end
end
