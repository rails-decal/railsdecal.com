class Admin::UsersController < Admin::BaseController
  before_filter :users, only: [:index]

  def index
  end

  def students
    @users = User.current_students
  end

  private

  def users
    @users = User.all
  end

end
