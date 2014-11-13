namespace :newsletter do
  task :send => :environment do
    t = Time.now
    if t.tuesday? or t.thursday? or t.sunday?
      puts "sending email"
      @followers = Follower.all
      @users = User.all
      followers_array = []
      @followers.each do |follower|
        followers_array << follower.email
      end
      @user.each do |user|
        followers_array << user.email
      end
      final_array = followers_array.uniq
      UserMailer.welcome_email([final_array]).deliver

#       UserMailer.welcome_email(["andy.n.gimma@gmail.com", "adaptdroid@gmail.com"]).deliver
      puts "done"
    else 
      puts "not sending email, wrong day of the week"
    end
  end
end