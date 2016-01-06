class Admin::AbsencesController < Admin::BaseController
  def index
    @absences = Absence.where(approved: 'pending')
  end

  def show
    @absence = Absence.find(params[:id])
    @user = User.find(@absence.user_id)
  end

  def accept
    @absence = Absence.find(params[:id])
    @absence.approved = 1
    if @absence.save
      flash[:accept] = "Absence request has been accepted!"
    else
      flash[:error] = "Please try again."
    end
    redirect_to admin_absences_path
  end

  def reject
    @absence = Absence.find(params[:id])
    @absence.approved = 2
      if @absence.save
        flash[:reject] = "Absence request has been rejected!"
      else
        flash[:error] = "Please try again."
      end
    redirect_to admin_absences_path
  end
end
