class StudentApplicationCsv
  COLUMN_NAMES = %w(id student_id last_name first_name email status standing)

  def self.to_csv(student_applications)
    CSV.generate do |csv|
      csv << COLUMN_NAMES
      student_applications.each do |app|
        csv << [app.id, app.student_id, app.last_name, app.first_name, app.email, app.status, app.standing]
      end
    end
  end

end
