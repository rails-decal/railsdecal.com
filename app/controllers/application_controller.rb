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

  def admin_user
    redirect_to(root_url) unless current_user && current_user.is_staff?
  end

  def after_sign_in_path_for(user)
    if user.submitted_current_semester_application?
      if user.enabled
        user
      else
        root_path
      end
    else
      why_path
    end
  end

end
