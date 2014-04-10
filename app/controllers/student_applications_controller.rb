class StudentApplicationsController < ApplicationController
  before_filter :student_application, only: [:create]

  def new
    @student_application = StudentApplication.new
  end

  def create

  end

  private

  def student_application
    @student_application = StudentApplication.find(params[:id])
  end

end
