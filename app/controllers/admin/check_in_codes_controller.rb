class Admin::CheckInCodesController < Admin::BaseController
  load_and_authorize_resource :check_in_code

  require 'securerandom'

  def index
  end

  def show
  end

  def new
    @check_in_code.code = SecureRandom.hex(4)
  end

  def create
    @check_in_code = CheckInCode.new(check_in_code_params)
    if @check_in_code.save
      flash[:info] = "Your check in code was created."
      redirect_to admin_check_in_code_path(@check_in_code)
    else
      flash[:error] = "There was a problem creating the check in code."
      render "new"
    end
  end

  def disable
    @check_in_code.update(enabled: false)
    redirect_to admin_check_in_codes_path
  end

  def enable
    @check_in_code.update(enabled: true)
    redirect_to admin_check_in_codes_path
  end

  private

  def check_in_code_params
    params.require(:check_in_code).permit(:code, :class_date)
  end

end
