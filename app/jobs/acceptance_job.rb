class AcceptanceJob < ActiveJob::Base
  queue_as :default

  def perform(student_application_id)
    puts "Yay performed job"
    AcceptanceMailer.accept(student_application_id).deliver_later
    student_application = StudentApplication.find(student_application_id)
    user = student_application.user
    user.update enabled: true if user
  end
end
