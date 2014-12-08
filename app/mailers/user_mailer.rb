class UserMailer < ActionMailer::Base
  default from: "Hero@theheroinitiative.org"
  
  def welcome_email(email)
    # TODO Send to multiple emails
    # Create a subject that depends on the day?
    # Create content that includes content, and includes a list of workshops for the week.
    email_json = email.to_json
    email_to_json = {:to => email}.to_json
    @workshops = Workshop.where("start_time >= ? AND end_time <= ?", 1.day.ago, 7.days.from_now)
#     headers["X-SMTPAPI"] = email_to_json
    mail(to: email, subject: "HERO workshops for the week of #{Date.today.strftime('%A %B %d') }")
    #try email_json
    #try email_to_json
#     @workshops = Workshop.all
    
        
#         Workshop.where("start_time >= :date and end_time <= :date2", date: 1.day.ago, date2: 7.days.from_now).order(start_time: :desc)

  end
  
  def new_workshop_email(email, workshop)
    @workshop = workshop
    mail(to: email, subject: "New HERO Workshop")
  end
end
