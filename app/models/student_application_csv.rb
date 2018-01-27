# == Schema Information
#
# Table name: student_applications
#
#  id                        :integer          not null, primary key
#  first_name                :string
#  last_name                 :string
#  email                     :string
#  phone_number              :string
#  year                      :string
#  major                     :string
#  gpa                       :string
#  why_join                  :text
#  cs_classes_taken          :text
#  current_courseload        :text
#  other_commitments         :text
#  how_did_you_hear_about_us :text
#  how_many_hours_willing    :text
#  created_at                :datetime
#  updated_at                :datetime
#  user_id                   :integer
#  semester_id               :integer
#  standing                  :integer          default(0)
#  status                    :integer          default(0)
#  student_id                :string
#  semesters_applied_before  :text
#

class StudentApplicationCsv
  COLUMN_NAMES = %w(id student_id last_name first_name email status standing year major why_join cs_classes_taken current_courseload other_commitments how_many_hours_willing semesters_applied_before)

  def self.to_csv(student_applications)
    CSV.generate do |csv|
      csv << COLUMN_NAMES
      student_applications.each do |app|
        csv << [app.id, app.student_id, app.last_name, app.first_name, app.email, app.status, app.standing, app.year, app.major, app.why_join, app.cs_classes_taken, app.current_courseload, app.other_commitments, app.how_many_hours_willing, app.semesters_applied_before]
      end
    end
  end

end
