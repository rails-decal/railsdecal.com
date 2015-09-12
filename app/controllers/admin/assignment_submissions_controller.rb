class Admin::AssignmentSubmissionsController < Admin::BaseController
  def index
    @assignment_submissions = Semester.current.assignment_submissions
  end
end
