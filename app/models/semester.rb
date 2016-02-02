# == Schema Information
#
# Table name: semesters
#
#  id                      :integer          not null, primary key
#  semester                :string
#  year                    :integer
#  created_at              :datetime
#  updated_at              :datetime
#  url                     :string
#  lower_division_limit    :integer
#  upper_division_limit    :integer
#  application_deadline    :datetime
#  acceptance_release_date :datetime
#  day_of_week             :integer
#  start_time              :string
#  end_time                :string
#  location                :string
#

class Semester < ActiveRecord::Base
  validates :day_of_week, presence: true

  has_many :lectures
  has_many :roles
  has_many :assignments
  has_many :assignment_submissions, through: :assignments
  has_many :student_applications

  enum day_of_week: [:monday, :tuesday, :wednesday, :thursday, :friday]
  before_create :set_url

  def set_url
    self.url = "#{semester.downcase}-#{year}"
  end

  def name
    "#{semester} #{year}"
  end


  def accepted_student_applications
    student_applications.accepted
  end

  def number_of_accepted_upperclassmen
    accepted_student_applications.upperclassman.count
  end

  def number_of_accepted_lowerclassmen
    accepted_student_applications.lowerclassman.count
  end

  def formatted_application_deadline
    formatted_date application_deadline
  end

  def formatted_acceptance_release_date
    formatted_date acceptance_release_date
  end

  def info
    "The class time is #{ day_of_week }.humanize, #{ start_time } -
      #{ end_time } at #{ location } for #{ name }."
  end

  class << self
    def current
      last
    end
  end

  private

  def formatted_date(datetime)
    datetime.strftime('%B %-d')
  end

end
