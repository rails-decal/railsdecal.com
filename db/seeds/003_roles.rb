instructor = Position.create!(name: "Instructor")
ta = Position.create!(name: "TA")
student = Position.create!(name: "Student")

fall_2014 = Semester.where(semester: "Fall", year: 2014)
