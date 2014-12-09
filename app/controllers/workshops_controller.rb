class WorkshopsController < ApplicationController
  # TODO
  # check_admin should be check_credentials
  # a user either needs ownership, or to be an admin... I guess we can't do this before.
  # so before filter is user_authentication!
  # in edit, update, destroy, needs to be either admin, or have ownership
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy, :approve]
  # check ownership
  def new
#     binding.pry
    @workshop = Workshop.new
    @locations = Location.all
  end

  def create
#     binding.pry
    @workshop= Workshop.create(workshop_params)
    if @workshop.valid?
      begin
        UserMailer.new_workshop_email(["jelanimashariki@gmail.com"], @workshop).deliver
      rescue
        puts "mail failed to send"
      end
      flash[:notice] = "Thank you! The workshop you added will be reviewed by a site administrator."

      redirect_to workshops_path
    else
      str = ""
      @workshop.errors.messages.each do |e|
        str += "#{e.to_s}"
      end
      flash[:alert] = str
      @locations = Location.all
#       binding.pry
      render "/workshops/new"
    end
  end

  def update
    @workshop = Workshop.find(params[:id])
    
    if current_user.admin? or current_user.id = @workshop.id
      @workshop.update(workshop_params)
      redirect_to workshops_path(@workshop)
    else
      redirect_to workshops_path
    end
 
  end

  def edit
    @workshop = Workshop.find(params["id"]) 
    if current_user.admin? or current_user.id = @workshop.id
      @locations = Location.all
    else
      redirect_to workshops_path
    end
  end

  def destroy
    @workshop = Workshop.find(params["id"])
    @workshop.destroy
    redirect_to workshops_path
  end

  def show
    @workshop = Workshop.find(params[:id])
#     binding.pry
    if @workshop.approved == false and not current_user.admin?
      redirect_to workshops_path
    end
    @rsvp = []
    if current_user
      @rsvp = Rsvp.where(user_id: current_user.id, workshop_id: params[:id])
    end
#     binding.pry
  end

  def index
    # get only after today's date
    some_date = Date.yesterday
    @workshops = Workshop.paginate(:page => params[:page]).where("start_time >= :date", date: 1.day.ago).where(approved: true).order(start_time: :desc)
  end
  
  def calendar
    @workshops = Workshop.where(approved: true)
    @workshops_by_date = @workshops.group_by(&:start_date)
  end
  
  def pending
    @workshops = Workshop.paginate(:page => params[:page]).where(approved: false)
  end
  
  def approve
    @workshop = Workshop.find(params[:id])
    @workshop.update_attributes(approved: true)
    redirect_to "/workshops/#{@workshop.id}"
  end
  
  
  private

    def workshop_params
      params.require(:workshop).permit(:title, :context, :location_id, :date, :start_time, :end_time, :user_id)
    end
    
    def check_admin
      if not current_user
        redirect_to "/users/sign_in"
      end
      if current_user and not current_user.admin?
        redirect_to root_path
      end
    end
end
