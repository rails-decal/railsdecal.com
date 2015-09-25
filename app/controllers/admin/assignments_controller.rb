class Admin::AssignmentsController < Admin::BaseController
  def index
    @assignments = Semester.current.assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
  end
end
