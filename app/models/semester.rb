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
#

class Semester < ActiveRecord::Base
  has_many :lectures
  has_many :roles
  has_many :assignments
  has_many :student_applications

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

  class << self
    def current
      last
    end
  end

  private

  def formatted_date(datetime)
    datetime.strftime('%B %-d, %C')
  end

end
