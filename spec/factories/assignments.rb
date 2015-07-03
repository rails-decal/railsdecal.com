# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    user
    semester
    link "MyString"
    deadline "2015-07-02 20:59:43"
  end
end
