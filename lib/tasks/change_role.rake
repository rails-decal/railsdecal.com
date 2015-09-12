namespace :change_role do
  desc "Convert primary email user to student."
  task student: :environment do
    change_role Role::STUDENT
  end

  desc "Convert primary email user to instructor."
  task instructor: :environment do
    change_role Role::INSTRUCTOR
  end

  desc "Changes user to TA"
  task ta: :environment do
    change_role Role::TA
  end

  desc "Changes user to observer"
  task observer: :environment do
    change_role Role::OBSERVER
  end

  def user
    User.find_by_email ENV['PRIMARY_EMAIL']
  end

  def change_role(role)
    user.add_role_for_current_semester role
  end

end
