# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  semester_id :integer
#  link        :string
#  name        :string
#  category    :integer          default(0)
#  weight      :float            default(1.0)
#  points      :integer
#  deadline    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Assignment do
end
