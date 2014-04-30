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

  before_create :set_url

  def set_url
    self.url = "#{semester.downcase}-#{year}"
  end

  class << self
    def current
      last
    end
  end

end
