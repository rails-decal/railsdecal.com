FactoryGirl.define do
  factory :user do
    name "Howard Chen"
    sequence :nickname do |n|
      "Student #{n}"
    end
    sequence :email do |n|
      "person#{n}@example.com"
    end
  end
end
