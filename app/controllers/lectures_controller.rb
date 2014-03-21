class LecturesController < ApplicationController
  before_filter :lecture, only: [:show]
  before_filter :lectures, only: [:index]

  def show
  end

  def index
  end

  private

  def lecture
    @lecture = Lecture.find(params[:id])
  end

  def lectures
    @lectures = Lecture.by_year_and_semester
  end

end
