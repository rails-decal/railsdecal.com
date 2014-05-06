# == Schema Information
#
# Table name: evaluations
#
#  id                     :integer          not null, primary key
#  decision               :text
#  user_id                :integer
#  student_application_id :integer
#  comment                :text
#  created_at             :datetime
#  updated_at             :datetime
#

class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :student_application
end
