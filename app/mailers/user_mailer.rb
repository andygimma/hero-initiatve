class UserMailer < ActionMailer::Base
  default from: "admin@theheroinitiative.org"
  
  def welcome_email(email)
    # TODO Send to multiple emails
    # Create a subject that depends on the day?
    # Create content that includes content, and includes a list of workshops for the week.
    mail(to: email, subject: "Test")
#     @workshops = Workshop.all
    
    @workshops = Workshop.where("start_time >= ? AND end_time <= ?", 1.day.ago, 7.days.from_now)
        
#         Workshop.where("start_time >= :date and end_time <= :date2", date: 1.day.ago, date2: 7.days.from_now).order(start_time: :desc)

  end
end
