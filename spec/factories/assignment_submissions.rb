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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment_submission do
    user
    assignment
    points nil
    time_submitted "2015-07-10 12:49:18"
  end
end
