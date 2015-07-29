class AcceptanceJob < ActiveJob::Base
  queue_as :default

  def perform(student_application_id)
    student_application = StudentApplication.find(student_application_id)
    user = student_application.user
    user.update enabled: true if user
    AcceptanceMailer.delay.accept(student_application_id)
  end
end
