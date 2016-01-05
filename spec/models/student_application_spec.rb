# == Schema Information
#
# Table name: student_applications
#
#  id                        :integer          not null, primary key
#  first_name                :string
#  last_name                 :string
#  email                     :string
#  phone_number              :string
#  year                      :string
#  major                     :string
#  gpa                       :string
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
#  standing                  :integer          default(0)
#  status                    :integer          default(0)
#  student_id                :integer
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
    let(:semester) { create :semester }

    before do
      20.times do
        create :accepted_upper_division_student_application, semester: semester
      end

      30.times do
        create :accepted_lower_division_student_application, semester: semester
      end
    end

    it "should know how many upperclassmen are accepted" do
      expect(semester.number_of_accepted_upperclassmen).to be 20
    end

    it "should know how many lowerclassmen are accepted" do
      expect(semester.number_of_accepted_lowerclassmen).to be 30
    end

    it "should be able to add more students in upper division" do
      unaccepted_student_application = create :upper_division_student_application
      expect(unaccepted_student_application.accept).to be true
    end

    it "should be able to add more students in lower division" do
      unaccepted_student_application = create :lower_division_student_application
      expect(unaccepted_student_application.accept).to be true
    end

    it "should not add more students in lower division" do
      50.times do
        create :accepted_lower_division_student_application, semester: semester
      end
      unaccepted_student_application = create :lower_division_student_application, semester: semester
      expect(unaccepted_student_application.accept).to be false
    end

    it "should not add more students in upper division" do
      40.times do
        create :accepted_upper_division_student_application, semester: semester
      end
      unaccepted_student_application = create :upper_division_student_application, semester: semester
      expect(unaccepted_student_application.accept).to be false
    end

  end
end
