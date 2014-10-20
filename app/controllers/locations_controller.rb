class LocationsController < ApplicationController
#   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def new
    @location = Location.new
  end

  def create
    @location= Location.create(location_params)
    if @location.valid?
      redirect_to locations_path
    else
      str = ""
      @location.errors.each do |e|
        str += "#{e.to_s} is invalid\n"
      end
      flash[:alert] = str
      @location
#       binding.pry
      redirect_to "/locations/new"
    end
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
    @locations = Location.paginate(:page => params[:page]).order(:name)
  end
  
  def map
    @locations = Location.all
  end
  
  private

    def location_params
      params.require(:location).permit(:name, :address, :city, :state, :phone1, :email)
    end
end
