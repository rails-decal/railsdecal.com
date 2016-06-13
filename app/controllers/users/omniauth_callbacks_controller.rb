class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    @user = User.find_for_github_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication # this will throw if @user is not activated
      unless @user.enabled
        flash[:info] = "Thanks for signing up. Make sure you apply <a href='/apply'>here!</a>".html_safe
      end
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
