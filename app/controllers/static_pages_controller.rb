class StaticPagesController < ApplicationController
  layout "static", only: [:index]
  def index
  end
  def about
  end
  def sign_up
    @follower = Follower.new
  end
end
