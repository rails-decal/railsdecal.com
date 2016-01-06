class AbsencesController < ApplicationController
  def index
    @absences = Absence.where(user_id: current_user.id)
  end

  def new
    @absence = Absence.new
  end

  def create
    absence = Absence.new absence_params_with_user
    if absence.save
      flash[:success] = "Your request has been created."
      redirect_to root_path
    else
      flash[:error] = "An error has occurred."
      redirect_to action: :index
    end
  end

  private
  def absence_params
    params.require(:absence).permit(:excuse)
  end

  def absence_params_with_user
    absence_params.merge user_id: current_user.id
  end
end
