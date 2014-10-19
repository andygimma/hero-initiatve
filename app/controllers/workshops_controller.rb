class WorkshopsController < ApplicationController
  def new
    @workshop = Workshop.new
    @locations = Location.all
  end

  def create
    @workshop= Workshop.create(workshop_params)
    redirect_to workshops_path
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
  end

  def index
    @workshops = Workshop.paginate(:page => params[:page])
  end
  
  private

    def workshop_params
      params.require(:workshop).permit(:title, :context, :places_id, :date, :start_time, :end_time)
    end
end
