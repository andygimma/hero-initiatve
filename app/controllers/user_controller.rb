class UserController < ApplicationController
  def profile
    @rsvps = Rsvp.where(user_id: current_user.id)
    @workshops = Workshop.where("start_time >= ? AND end_time <= ?", 1.day.ago, 7.days.from_now).where(approved: true)
  end
end
