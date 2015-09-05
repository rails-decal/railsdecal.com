class Admin::StudentApplicationsController < Admin::BaseController
  before_filter :semester
  before_filter :student_applications, only: [:index]
  before_filter :student_application, only: [:show, :accept, :pend]

  def index
    respond_to do |format|
      format.html
      format.csv { send_data StudentApplicationCsv.to_csv @student_applications }
    end
  end

  def show
    evaluations = @student_application.evaluations
    @evaluation = evaluations.find_by_user_id(current_user.id) || evaluations.build
  end

  def accept
    if student_application.accept
      flash[:accept] = "Accepted #{student_application.first_name}"
    else
      flash[:error] = "Max occupancy has been reached"
    end
    next_application
  end

  def pend
    if student_application.pend
      flash[:accept] = "Pended #{student_application.first_name}"
    else
      flash[:error] = "Error occured"
    end
    next_application
  end

  private

  def student_applications
    @student_applications = StudentApplication.current
    @application_size = @student_applications.size
    @pending = @student_applications.pending
    upperclassmen = @student_applications.upperclassman
    lowerclassmen = @student_applications.lowerclassman
    @accepted_upperclassmen = upperclassmen.accepted
    @accepted_lowerclassmen = lowerclassmen.accepted
    @waitlisted_upperclassmen = upperclassmen.waitlisted
    @waitlisted_lowerclassmen = lowerclassmen.waitlisted
    @rejected = @student_applications.rejected
  end

  def student_application
    @student_application = StudentApplication.find(params[:id])
  end

  def semester
    @semester = Semester.find_by(url: params[:semester_url])
  end

  def next_application
    semester_url = student_application.semester.url

    if student_application.next.nil?
      redirect_to admin_student_applications_path(semester_url: semester_url)
    else
      redirect_to admin_student_application_path(semester_url: semester_url, id: student_application.next.id)
    end
  end

end
