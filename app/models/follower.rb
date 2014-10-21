class Follower < ActiveRecord::Base
  validates :title, presence: true
end
