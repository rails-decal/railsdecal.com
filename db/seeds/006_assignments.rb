if Rails.env.development?
  semester = Semester.last
  (1..4).each do |index|
    Assignment.create(
      name: "assignment #{index}",
      semester: semester
     )
  end
end
