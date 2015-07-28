# == Schema Information
#
# Table name: semesters
#
#  id                   :integer          not null, primary key
#  semester             :string
#  year                 :integer
#  created_at           :datetime
#  updated_at           :datetime
#  url                  :string
#  lower_division_limit :integer
#  upper_division_limit :integer
#

require 'spec_helper'

describe Semester do
  pending "add some examples to (or delete) #{__FILE__}"
end
