if Rails.env.development?
  semester = Semester.last
  (1..4).each do |index|
    Assignment.create(
      name: "assignment #{index}",
      semester: semester,
      points: 5,
      deadline: DateTime.now + index.days,
      link: "https://github.com/rails-decal/lab#{1 + index}"
     )
  end
end
