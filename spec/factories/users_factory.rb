FactoryGirl.define do
  factory :user do
    name "Howard Chen"
    nickname "Howie"
    sequence :email do |n|
      "person#{n}@example.com"
    end
  end
end
