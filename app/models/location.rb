class Location < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :lat, :lng
  acts_as_mappable

  RADIUS = 10 # km

  def to_s
    { lat: lat, lng: lng }
  end
end
