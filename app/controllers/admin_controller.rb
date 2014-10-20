class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create_user
    if not current_user
      redirect_to root_path
    end
    u = User.new(:email => params["email"], :password => params["password"], :password_confirmation => params["password"])
    u.save
    
    redirect_to "/admin"
  end

end
