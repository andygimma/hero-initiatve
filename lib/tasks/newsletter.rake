namespace :newsletter do
  desc "Send Newsletter"
  
  task :send => :environment do
    Mail.deliver do
      to "andy.n.gimma@gmail.com"
      from 'sender@example.comt'
      subject 'testing send mail'
      body 'Sending email with Ruby through SendGrid!'
    end  
  end
  # test
end