feature "User creates a Student Application" do
  scenario "they don't complete the application form" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit new_student_application_path
    fill_in "student_application_first_name", with: "Howie"
    click_button "Submit"

    expect(page).to have_text("There was an error submitting your application.")
  end

  scenario "they go to form page" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit new_student_application_path

    expect(page).to have_field("student_application_first_name",
      with: user.first_name)
  end

  scenario "they complete the form and acceptance flashes" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit new_student_application_path
    fill_in "student_application_first_name", with: "Howie"
    fill_in "student_application_last_name", with: "Chen"
    fill_in "student_application_email", with: "test@test.com"
    select "Junior", from: "student_application_year"
    select "Lowerclassman", from: "student_application_standing"
    fill_in "student_application_major", with: "Math"
    fill_in "student_application_why_join", with: "Just cause"
    fill_in "student_application_cs_classes_taken", with: "None"
    fill_in "student_application_current_courseload", with: "Nada"
    fill_in "student_application_other_commitments", with: "Nope"
    fill_in "student_application_how_many_hours_willing", with: "10"
    select "Facebook", from: "student_application_how_did_you_hear_about_us"
    click_button "Submit"

    expect(page).to have_text(
      "Thanks for applying! We'll get back to you with our decision."
    )
  end

  scenario "they complete the form and user updates" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit new_student_application_path
    fill_in "student_application_first_name", with: "Howie"
    fill_in "student_application_last_name", with: "Chen"
    fill_in "student_application_email", with: "test@test.com"
    select "Junior", from: "student_application_year"
    select "Lowerclassman", from: "student_application_standing"
    fill_in "student_application_major", with: "Math"
    fill_in "student_application_why_join", with: "Just cause"
    fill_in "student_application_cs_classes_taken", with: "None"
    fill_in "student_application_current_courseload", with: "Nada"
    fill_in "student_application_other_commitments", with: "Nope"
    fill_in "student_application_how_many_hours_willing", with: "10"
    select "Facebook", from: "student_application_how_did_you_hear_about_us"
    click_button "Submit"

    expect(user.lowerclassman?).to be_true
  end

end
