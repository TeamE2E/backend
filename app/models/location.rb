class Location < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :lat, :lng
  acts_as_mappable
end
