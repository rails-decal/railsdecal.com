# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  semester   :string(255)
#  year       :integer
#  created_at :datetime
#  updated_at :datetime
#  url        :string(255)
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

  class << self
    def current
      last
    end
  end

end
