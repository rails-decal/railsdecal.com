FactoryGirl.define do
  factory :student_application do
    first_name "Howard Chen"
    last_name "Howie"
    sequence :email do |n|
      "student#{n}@berkeley.edu"
    end
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
    semester

    trait :accepted do
      status :accepted
    end

    trait :upper_division do
      standing :upperclassman
    end

    trait :lower_division do
      standing :lowerclassman
    end

    factory :accepted_upper_division_student_application, traits: [:upper_division, :accepted]
    factory :accepted_lower_division_student_application, traits: [:lower_division, :accepted]

  end
end
