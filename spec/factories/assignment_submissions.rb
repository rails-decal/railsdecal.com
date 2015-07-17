# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment_submission do
    user nil
    assignment nil
    points 1
    time_submitted "2015-07-10 12:49:18"
  end
end
