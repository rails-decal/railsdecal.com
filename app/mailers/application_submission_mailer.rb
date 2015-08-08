class ApplicationSubmissionMailer < ApplicationMailer
  def send_confirmation(student_application_id)
    @student_application = StudentApplication.find(student_application_id)
    @semester = Semester.current
    puts "Emplating"
    mail(to: @student_application.email, subject: "Rails Decal Application Received!")
  end
end
