class AssignmentsController <  ApplicationController
  def index
    @assignments = Semester.current.assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def create
    assignment = Assignment.new assignment_params
    if assignment.save
      flash[:success] = "#{assignment.name} has been created."
      redirect_to assignment_path assignment
    else
      flash[:error] = "An error has occured while saving the #{assignment.name}."
      redirect_to :index
    end
  end

  def update
    assignment = Assignment.find(params[:id])
    if assignment.update(assignment_params)
      flash[:success] = "#{assignment.name} has been updated."
      redirect_to assignment_path assignment
    else
      flash[:error] = "An error has occured while updating #{assignment.name}"
      redirect_to :index
    end
  end

  def destroy
    assignment = Assignment.find(params[:id])
    if assignment.destroy
      flash[:success] = "#{assignment.name} has been destroyed"
      redirect_to assignment_path assignment
    else
      flash[:error] = "An error has occured while destroying #{assignment.name}"
      redirect_to :index
    end
  end
end
