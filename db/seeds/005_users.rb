if Rails.env.development? && User.count > 0
  (1..100).each do |index|
    user = User.create(
      email: "user#{index}@user.com",
      password: "password",
      name: "user#{index} user#{index}",
      nickname: "user#{index}",
    )
    user.add_role_for_current_semester(Role::STUDENT)
  end
end
