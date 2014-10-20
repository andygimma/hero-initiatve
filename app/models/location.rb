class Location < ActiveRecord::Base
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  has_many :workshops
  def full_street_address
    @address = "#{self.address} #{self.city} #{self.state}"
  end
end
