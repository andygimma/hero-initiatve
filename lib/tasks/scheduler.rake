namespace :newsletter do
  task :send => :environment do
    t = Time.now
    if t.tuesday? or t.thursday? or t.sunday?
      puts "sending email"
      @followers = Follower.all
      followers_array = []
      @followers.each do |follower|
        followers_array << follower.email
      end
      UserMailer.welcome_email([followers_array]).deliver

#       UserMailer.welcome_email(["andy.n.gimma@gmail.com", "adaptdroid@gmail.com"]).deliver
      puts "done"
    else 
      puts "not sending email, wrong day of the week"
    end
  end
end