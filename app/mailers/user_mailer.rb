class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome_email(email)
    binding.pry
    mail(to: email, subject: "Test")
  end
end
