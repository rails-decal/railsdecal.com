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

require 'spec_helper'

describe Evaluation do
  pending "add some examples to (or delete) #{__FILE__}"
end
