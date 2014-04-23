instructor = Position.create!(name: "Instructor")
ta = Position.create!(name: "TA")
student = Position.create!(name: "Student")

fall_2014 = Semester.where(semester: "Fall", year: 2014).first

user = User.first
unless user.nil?
  user.enabled = true
  user.save
  user.roles << Role.create!(position: instructor, semester: Semester.current)
end
