class StaticPagesController < ApplicationController
  layout "static", only: [:index]
  layout "sign_up", only: [:sign_up]
  def index
  end
  def about
  end
  def sign_up
    @follower = Follower.new
  end
end
