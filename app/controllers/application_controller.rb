class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :enabled_user?, :authorize_user

  def enabled_user?
    current_user && current_user.enabled
  end

  def authorize_user
    unless enabled_user?
      redirect_to root_path
    end
  end

end
