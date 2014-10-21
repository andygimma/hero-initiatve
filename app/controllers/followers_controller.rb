class FollowersController < ApplicationController
  def new
  end

  def create
    # create follower here
    @follower= Follower.create(follower_params)
    if @follower.valid?
      flash[:notice] = "Thanks for following! You will get an email shortly."
    else
      msg = "Email "
      @follower.errors.messages[:email].each do |message|
        msg += message + " "
      flash[:alert] = msg
      end
      
    end
    redirect_to "/static_pages/sign_up"

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
