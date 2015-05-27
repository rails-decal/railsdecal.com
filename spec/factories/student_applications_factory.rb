FactoryGirl.define do
  factory :student_application do
    first_name "Howard Chen"
    last_name "Howie"
    email "basedgod@berkeley.edu"
    phone_number "510-123-4567"
    year "junior"
    major "Computer Science"
    gpa "4.00"
    why_join "Just cause"
    cs_classes_taken "CS 61A, CS 61B"
    current_courseload "CS 61C"
    other_commitments "None"
    how_did_you_hear_about_us "Facebook"
    how_many_hours_willing "10"
    user
  end
end
