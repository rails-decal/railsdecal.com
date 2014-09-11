class CheckInsController < ApplicationController

  def create
    @check_in_code = CheckInCode.find_by(check_in_code_params)
    if @check_in_code && @check_in_code.enabled
      @check_in = CheckIn.where(user: current_user, check_in_code: @check_in_code).first_or_initialize
      if @check_in.new_record? && @check_in.save
        flash[:info] = "Congrats, you have checked in for this week!"
        redirect_to root_path
      elsif !@check_in.new_record?
        flash[:warning] = "You have already checked in!"
        redirect_to root_path
      else
        flash[:danger] = "There was a problem checking in, please try again. If the problem persists, please talk to a TA."
        redirect_to root_path
      end
    else
      flash[:danger] = "You have entered an invalid code."
      redirect_to root_path
    end
  end

  private

  def check_in_code_params
    params.require(:check_in).permit(:code)
  end

end
