class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to @user
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :student_id)
  end
end
