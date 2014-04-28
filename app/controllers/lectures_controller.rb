class LecturesController < ApplicationController
  load_and_authorize_resource

  before_filter :lectures, only: [:index]

  def show
  end

  def index
  end

  private

  def lectures
    @lectures = Lecture.by_year_and_semester
  end

end
