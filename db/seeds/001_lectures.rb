
lecture_01 = Lecture.where(year: 2014, semester: 'Fall', number: 1, title: 'Introduction and General Web Development', partial: 'lecture_01_introduction').first_or_create!

# Remove these later
old_lecture = Lecture.where(year: 2013, semester: 'Fall', number: 1, title: 'asdf', partial: 'adf').first_or_create!
old_lecture2 = Lecture.where(year: 2014, semester: 'Spring', number: 1, title: 'asdf', partial: 'adf').first_or_create!
old_lecture3 = Lecture.where(year: 2014, semester: 'Spring', number: 2, title: 'asdfadsfasdfa', partial: 'adf').first_or_create!
