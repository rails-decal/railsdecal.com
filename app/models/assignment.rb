class Assignment < ActiveRecord::Base
  belongs_to :semester
  has_many :assignment_submissions
end
