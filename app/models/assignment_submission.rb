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
#  link           :string
#

class AssignmentSubmission < ActiveRecord::Base
  scope :graded, -> { where.not(grader: nil) }

  belongs_to :user
  belongs_to :assignment
  belongs_to :grader, class_name: "User"

  validate :grader_is_staff?
  validates :assignment, presence: true
  validates :user, presence: true
  validates :grader, presence: true, if: :is_graded?

  def is_graded?
    points != nil
  end

  def grader_name
    grader ? grader.name : "Unassigned"
  end

  def grade
    points ? "#{points}/#{assignment.points}" : "Not graded"
  end

  private

  def grader_is_staff?
    grader.nil? ? false : grader.is_staff_for_semester?(assignment.semester)
  end

end
