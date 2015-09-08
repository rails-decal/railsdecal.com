class AssignmentsController < ApplicationController
  def index
    @assignments = Semester.current.assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
    users_assignments = @assignment.assignment_submissions.where(user: current_user)
    @assignment_submission = users_assignments.first_or_initialize
    @button_text = "Submit Assignment"
    if @assignment_submission.id
      @button_text = "Update Submission Link"
    end
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new assignment_params
    if @assignment.update(semester: Semester.current)
      flash[:success] = "#{@assignment.name} has been created."
      redirect_to assignment_path @assignment
    else
      flash[:error] = "An error has occured while saving the #{@assignment.name}."
      redirect_to action: :index
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    render :new
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      flash[:success] = "#{@assignment.name} has been updated."
      redirect_to assignment_path @assignment
    else
      flash[:error] = "An error has occured while updating #{@assignment.name}"
      redirect_to :index
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    if @assignment.destroy
      flash[:success] = "#{@assignment.name} has been destroyed"
    else
      flash[:error] = "An error has occured while destroying #{@assignment.name}"
    end
    redirect_to action: :index
  end

  private
  def  assignment_params
    params.require(:assignment).permit(:name, :link, :category, :points, :deadline)
  end
end
