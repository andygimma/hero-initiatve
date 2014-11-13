class WorkshopsController < ApplicationController
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  def new
    @workshop = Workshop.new
    @locations = Location.all
  end

  def create
#     binding.pry
    @workshop= Workshop.create(workshop_params)
    if @workshop.valid?
      redirect_to workshops_path
    else
      str = ""
      @workshop.errors.messages.each do |e|
        str += "#{e.to_s}"
      end
      flash[:alert] = str
      @location
#       binding.pry
      redirect_to "/workshops/new"
    end
  end

  def update
    @workshop = Workshop.find(params[:id])
    @workshop.update(workshop_params)
    redirect_to workshops_path(@workshop) 
  end

  def edit
    @workshop = Workshop.find(params["id"]) 
    @locations = Location.all
  end

  def destroy
    @workshop = Workshop.find(params["id"])
    @workshop.destroy
    redirect_to workshops_path
  end

  def show
    @workshop = Workshop.find(params[:id])
    @rsvp = []
    if current_user
      @rsvp = Rsvp.where(user_id: current_user.id, workshop_id: params[:id])
    end
#     binding.pry
  end

  def index
    # get only after today's date
    some_date = Date.yesterday
    @workshops = Workshop.paginate(:page => params[:page]).where("start_time >= :date", date: 1.day.ago).order(start_time: :desc)
  end
  
  def calendar
    @workshops = Workshop.all
    @workshops_by_date = @workshops.group_by(&:start_date)
  end
  
  
  private

    def workshop_params
      params.require(:workshop).permit(:title, :context, :location_id, :date, :start_time, :end_time)
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
