# == Schema Information
#
# Table name: absences
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  excuse     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  approved   :integer          default(0)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :absence do
  end
end
