class Workshop < ActiveRecord::Base
  belongs_to :location
  validates :title, presence: true
  validates :context, presence: true
  validates :location_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  default_scope { order('start_time ASC') }

end
