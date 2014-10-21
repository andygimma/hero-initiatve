class FollowerController < ApplicationController
  def new
  end

  def create
    # create follower here
    @follower= Follower.create(follower_params)
    flash[:notice] = "Thanks for following! You will get an email shortly."
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
