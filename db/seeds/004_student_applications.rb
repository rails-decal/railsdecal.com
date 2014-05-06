if Rails.env.development?
  Semester.all.each do |semester|
    app1 = StudentApplication.where(
      first_name: 'Howie',
      last_name: 'Bear',
      email: 'yolo@swag.com',
      year: 'Sophmore',
      major: 'CS',
      why_join: 'Idk',
      cs_classes_taken: '61Swag',
      current_courseload: '61 Yolo',
      other_commitments: '61 Swag',
      how_many_hours_willing: 'All day err day',
      how_did_you_hear_about_us: 'friendz',
      semester: semester
    ).first_or_create

    app2 = StudentApplication.where(
      first_name: 'Marky',
      last_name: 'Mark',
      email: 'mush@room.com',
      year: 'Graduate',
      major: 'ECCS',
      why_join: 'To learn how trains work',
      cs_classes_taken: 'None',
      current_courseload: 'Grad Classez',
      other_commitments: 'This git commitment',
      how_many_hours_willing: '5 minutes',
      how_did_you_hear_about_us: 'Google Search',
      semester: semester
    ).first_or_create
  end
end
