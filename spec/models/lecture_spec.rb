# == Schema Information
#
# Table name: lectures
#
#  id          :integer          not null, primary key
#  number      :integer
#  title       :string(255)
#  partial     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  semester_id :integer
#

require 'spec_helper'

describe Lecture do
  pending "add some examples to (or delete) #{__FILE__}"
end
