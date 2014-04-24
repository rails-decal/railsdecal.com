class UsersController < ApplicationController
  before_filter :user, only: [:show]

  def show
  end

  private

  def user
    @user = User.find_by(nickname: params[:nickname])
  end

end
