class UsersController < ApplicationController
  before_action :user, only: [:show]
  before_action :correct_user, only: [:show]

  def show
  end

  private

  def user
    @user = User.find_by(nickname: params[:nickname])
  end

  def correct_user
    redirect_to(root_url) unless current_user == @user || admin_user
  end

end
