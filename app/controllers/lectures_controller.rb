class LecturesController < ApplicationController
  before_filter :lecture, only: [:show]

  def show
  end

  private

  def lecture
    @lecture = Lecture.find(params[:id])
  end

end
