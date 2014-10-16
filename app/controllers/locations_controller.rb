class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location= Location.create(location_params)
    redirect_to locations_path
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    redirect_to locations_path(@location) 
  end

  def edit
    @location = Location.find(params["id"]) 
  end

  def destroy
    @location = Location.find(params["id"])
    @location.destroy
    redirect_to locations_path
  end

  def show
    @location = Location.find(params[:id])
  end

  def index
#     @locations = Location.all # TODO paginate, make searchable
    @locations = Location.paginate(:page => params[:page])

  end
  
  private

    def location_params
      params.require(:location).permit(:name, :address, :city, :state, :phone1, :email)
    end
end
