class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome_email(email)
    # TODO Send to multiple emails
    # Create a subject that depends on the day?
    # Create content that includes content, and includes a list of workshops for the week.
    mail(to: email, subject: "Test")
  end
end
