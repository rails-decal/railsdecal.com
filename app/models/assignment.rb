# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  semester_id :integer
#  link        :string
#  name        :string
#  category    :integer          default(0)
#  weight      :float            default(1.0)
#  points      :integer
#  deadline    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assignment < ActiveRecord::Base
  belongs_to :semester
  has_many :assignment_submissions

  def formatted_deadline
    deadline.strftime("%B %d, %Y")
  end

  def submissions_graded_count
    assignment_submissions.graded.count
  end

  def submissions_total_count
    assignment_submissions.count
  end

  def submissions_count_string
    if submissions_total_count == 0
      return "No submissions"
    end
    "#{ submissions_graded_count }/#{ submissions_total_count } graded"
  end
end
