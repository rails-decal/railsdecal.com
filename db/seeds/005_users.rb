if Rails.env.development?
  (1..100).each do |index|
    User.create(
      email: "user#{index}@user.com",
      password: "password",
      name: "user#{index} user#{index}",
      nickname: "user#{index}",
    )
  end
end
