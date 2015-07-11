class AssignmentsController <  ApplicationController
  def index
    @assignments = Semester.current.assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
  end
end
