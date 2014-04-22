# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  semester   :string(255)
#  year       :integer
#  created_at :datetime
#  updated_at :datetime
#

class Semester < ActiveRecord::Base
  has_many :lectures
  has_many :roles

  class << self
    def current
      last
    end
  end

end
