class Admin::UsersController < Admin::BaseController
  before_filter :users, only: [:index]

  def index
  end

  private

  def users
    @users = User.all
  end

end
