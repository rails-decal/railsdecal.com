# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  semester_id :integer
#  position_id :integer
#

require 'spec_helper'

describe Role do
  pending "add some examples to (or delete) #{__FILE__}"
end
