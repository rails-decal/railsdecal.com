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

require 'spec_helper'

describe AssignmentSubmission do
  pending "add some examples to (or delete) #{__FILE__}"
end
