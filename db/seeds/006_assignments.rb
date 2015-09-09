if Rails.env.development?
  semester = Semester.last
  (1..4).each do |index|
    Assignment.create(
      name: "Assignment #{index}",
      semester: semester,
      points: index,
      deadline: DateTime.now + index.days,
      link: "https://github.com/rails-decal/lab#{1 + index}"
     )
  end
end
