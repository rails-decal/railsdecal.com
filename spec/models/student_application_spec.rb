# == Schema Information
#
# Table name: student_applications
#
#  id                        :integer          not null, primary key
#  first_name                :string(255)
#  last_name                 :string(255)
#  email                     :string(255)
#  phone_number              :string(255)
#  year                      :string(255)
#  major                     :string(255)
#  gpa                       :string(255)
#  why_join                  :text
#  cs_classes_taken          :text
#  current_courseload        :text
#  other_commitments         :text
#  how_did_you_hear_about_us :text
#  how_many_hours_willing    :text
#  created_at                :datetime
#  updated_at                :datetime
#  user_id                   :integer
#  semester_id               :integer
#

require 'spec_helper'

describe StudentApplication do
  pending "add some examples to (or delete) #{__FILE__}"
end
