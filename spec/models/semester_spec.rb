# == Schema Information
#
# Table name: semesters
#
#  id                      :integer          not null, primary key
#  semester                :string
#  year                    :integer
#  created_at              :datetime
#  updated_at              :datetime
#  url                     :string
#  lower_division_limit    :integer
#  upper_division_limit    :integer
#  application_deadline    :datetime
#  acceptance_release_date :datetime
#  day_of_week             :integer
#  start_time              :string
#  end_time                :string
#  location                :string
#

require 'spec_helper'

describe Semester do
  pending "add some examples to (or delete) #{__FILE__}"
end
