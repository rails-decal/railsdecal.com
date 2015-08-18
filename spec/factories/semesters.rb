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
#

FactoryGirl.define do
  factory :semester do
    semester "Fall"
    year "2015"
    upper_division_limit 60
    lower_division_limit 80
  end
end
