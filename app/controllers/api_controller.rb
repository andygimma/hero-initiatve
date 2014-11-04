class ApiController < ApplicationController
  def locations
    @locations = Location.all
    render :json =>  @locations, :include => :workshops
  end

  def workshops
    @workshops = Workshop.where("start_time >= :date", date: 1.day.ago).order(start_time: :desc)
    render :json => @workshops, :include => :location
  end

  def map
    @locations = Location.all
    render :json =>  @locations, :include => :workshops
  end

  def sign_up
#     @follower= Follower.create(follower_params)
#     @response = {"message" => "Thank you for signing up"}
#     render :json => @response
  end
  
#   private
#     def follower_params
#       params.require(:email)
#     end
end
