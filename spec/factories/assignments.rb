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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    user
    semester
    link "MyString"
    deadline "2015-07-02 20:59:43"
  end
end
