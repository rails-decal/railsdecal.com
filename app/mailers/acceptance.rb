class Acceptance < ApplicationMailer
  def accept(student_application_id)
    @student_application = StudentApplication.find(student_application_id)
    mail(to: @student_application.email, subject: "Rails Decal Application")
  end
end
