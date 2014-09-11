class PagesController < ApplicationController

  def home
    @check_in = CheckIn.new
  end

  def why_this_class
  end

end
