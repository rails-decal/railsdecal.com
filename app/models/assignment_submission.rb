# == Schema Information
#
# Table name: assignment_submissions
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  assignment_id  :integer
#  points         :integer
#  time_submitted :datetime
#  grader_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AssignmentSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  belongs_to :grader, class_name: "User"

  validate :grader_is_staff?
  validates :assignment, presence: true
  validates :user, presence: true
  validates :grader, presence: true, if: :is_graded?

  private

  def grader_is_staff?
    grader.is_staff_for_semester? semester
  end

  def is_graded?
    points != nil
  end
end
