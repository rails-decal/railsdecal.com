fall_2014 = Semester.find_by(semester: "Fall", year: 2014)

lecture_01 = Lecture.where(semester: fall_2014, number: 1, title: 'Introduction and General Web Development', partial: 'lecture_01_introduction').first_or_create!
