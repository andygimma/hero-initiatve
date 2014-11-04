namespace :newsletter do
  task :send => :environment do
    t = Time.now
    if t.tuesday? or t.thursday? or t.sunday?
      puts "sending email"
      UserMailer.welcome_email("andy.n.gimma@gmail.com").deliver
      puts "done"
    else 
      puts "not sending email, wrong day of the week"
    end
  end
end