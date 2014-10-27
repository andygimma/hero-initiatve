class FollowerController < ApplicationController
  def new
  end

  def create
    create follower here
    raise "!23123"
    @follower= Follower.create(follower_params)
    flash[:notice] = "Thanks for following! You will get an email shortly."
    binding.pry
    UserMailer.welcome_email(@follower.email).deliver
#     Mail.deliver do
#       to @follower.email
#       from 'sender@example.comt'
#       subject 'testing send mail'
#       body 'Sending email with Ruby through SendGrid!'
#     end
    redirect_to root_path

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
  end
  
  private
    def follower_params
      params.require(:follower).permit(:email)
    end
end
