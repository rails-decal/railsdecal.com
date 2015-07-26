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

  describe "validation" do
    it "should be valid if all form fields are filled" do
      student_application = FactoryGirl.build(:student_application)

      expect(student_application).to be_valid
    end

    it "should have a first name" do
      student_application = FactoryGirl.build(:student_application)
      student_application.first_name = nil

      expect(student_application).to_not be_valid
    end

    it "should have a last name" do
      student_application = FactoryGirl.build(:student_application)
      student_application.last_name = nil

      expect(student_application).to_not be_valid
    end

  end

  describe "class sizes" do

    it "should know how many upperclassmen are signed up" do
      (0..20).each do
        create :upper_division_student_application
      end
    end
  end
end
