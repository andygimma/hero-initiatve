class RsvpController < ApplicationController
  before_action :authenticate_user!

  def create
    #make sure this rsvp doesn't exist
    Rsvp.create(user_id: current_user.id, workshop_id: params[:id])
    redirect_to "/workshops/#{params[:id]}"
  end

  def destroy
    rsvp = Rsvp.where(user_id: current_user.id, workshop_id: params[:id])
#     binding.pry
    Rsvp.destroy(rsvp)
    redirect_to "/workshops/#{params[:id]}"
  end
  
end
