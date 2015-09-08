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

require 'spec_helper'

describe AssignmentSubmission do
  subject(:assignment_submission) { FactoryGirl.create :assignment_submission }
  it "should not be valid without a user" do
    assignment_submission.user = nil
    expect(assignment_submission).to_not be_valid
  end
end
