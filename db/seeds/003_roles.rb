instructor = Position.where(name: Role::INSTRUCTOR).first_or_create
ta = Position.where(name: Role::TA).first_or_create
student = Position.where(name: Role::STUDENT).first_or_create
observer = Position.where(name: Role::OBSERVER).first_or_create

fall_2014 = Semester.where(semester: "Fall", year: 2014).first

user = User.first
unless user.nil?
  user.enabled = true
  user.save
  user.roles << Role.create!(position: instructor, semester: Semester.current)
end
