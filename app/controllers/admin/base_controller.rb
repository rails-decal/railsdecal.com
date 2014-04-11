class Admin::BaseController < ApplicationController
  before_action :admin_user

  private

  def admin_user
    redirect_to(root_url) unless current_user && current_user.is_staff?
  end

end
