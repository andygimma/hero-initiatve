class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create_user
    if not current_user
      redirect_to root_path
    end
    if params["password"].length < 8
      flash[:alert] = "Password must be at least 8 characters"
      redirect_to "/admin/index"
      return
    end
    u = User.new(:email => params["email"], :password => params["password"], :password_confirmation => params["password"])
    u.save
    
    flash[:notice] = "#{params["email"]} added"
    redirect_to "/admin/index"
  end
end
