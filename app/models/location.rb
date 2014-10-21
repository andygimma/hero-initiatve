class Location < ActiveRecord::Base
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  has_many :workshops
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :phone1, presence: true
  validates :email, presence: true

  def full_street_address
    @address = "#{self.address} #{self.city} #{self.state}"
  end
  
    
  def workshops_to_map
    @workshops = ""
    self.workshops.each do |workshop|
      @workshops += "#{workshop.title}<br>#{workshop.start_time.strftime("%B %d, %Y %a")}<br><br>"
    end
    @workshops
  end
end
