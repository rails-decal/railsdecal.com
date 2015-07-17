# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#  name                   :string(255)
#  nickname               :string(255)
#  image_url              :string(255)
#  bio                    :text
#  blog                   :string(255)
#  location               :string(255)
#  enabled                :boolean          default(FALSE)
#

require 'spec_helper'

describe User do

  subject(:user) { create :user }

  describe "validation" do

    it "should allow blank emails" do
      user = User.new

      expect(user).to be_valid
    end

    it "should now allow invalid email formats" do
      user = User.new(email: "bademail")

      expect(user).to_not be_valid
    end

    it "should allow valid email formats" do
      user = User.new(email: "good@email.com")

      expect(user).to be_valid
    end

    it "should not allow duplicate nicknames" do
      used_nickname = FactoryGirl.create(:user).nickname
      user = User.new(nickname: used_nickname)

      expect(user).to_not be_valid
    end

  end

  describe "methods" do

    it "should get the first name" do
      user = User.new(name: "First Last")

      expect(user.first_name).to eq("First")
    end

    it "should get the last name" do
      user = User.new(name: "First Last")

      expect(user.last_name).to eq("Last")
    end

  end

  describe "roles" do

    context "without adding a role" do
      it "should default to observer" do
        expect(user.current_role.name).to eq(Role::OBSERVER)
      end

      it "should not seem like a student" do
        expect(user.is_current_student?).to be_false
      end

      it "should not seem like a staff" do
        expect(user.is_current_staff?).to be_false
      end
    end

    context "with adding student role" do
      before do
        user.add_role_for_current_semester(Role::STUDENT)
      end

      it "should be recognize that the user is a current student" do
        expect(user.is_current_student?).to be_true
      end

      it "should not seem like a staff" do
        expect(user.is_current_staff?).to be_false
      end
    end

  end
end
