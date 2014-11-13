class AdminController < ApplicationController
  before_action :check_admin

  def index
    
  end

  def create_user
    if not current_user
      redirect_to root_path
      return
    end
    if params["password"].length < 8
      flash[:alert] = "Password must be at least 8 characters"
      redirect_to "/admin/index"
      return
    end

    @user = User.create(:email => params["email"], :password => params["password"], :password_confirmation => params["password"])
    if @user.valid?
      redirect_to workshops_path
      flash[:notice] = "#{params["email"]} added"
      redirect_to "/admin/index"
      return
    else
      str = ""
      @user.errors.messages.each do |e|
        str += "#{e.to_s}"
      end
      flash[:alert] = str
      redirect_to "/admin/index"
      return
    end
  end
  
  def locations
    @locations = Location.all
  end
  
  def workshops
    @workshops = Workshop.all
  end
  
  private
    
    def check_admin
      if not current_user
        redirect_to "/users/sign_in"
      end
      if current_user and not current_user.admin?
        redirect_to root_path
      end
    end
end
