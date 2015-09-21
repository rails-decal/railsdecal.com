class Admin::AssignmentsController < Admin::BaseController
  def index
    @assignments = Semester.current.assignments
  end
end
