# == Schema Information
#
# Table name: lectures
#
#  id          :integer          not null, primary key
#  number      :integer
#  title       :string
#  partial     :string
#  created_at  :datetime
#  updated_at  :datetime
#  semester_id :integer
#

require 'spec_helper'

describe Lecture do
  pending "add some examples to (or delete) #{__FILE__}"
end
