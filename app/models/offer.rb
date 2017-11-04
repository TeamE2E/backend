class Offer < ActiveRecord::Base
  belongs_to :user
  monetize :price_cents

  attr_accessor :fee, :total_amount, :distance, :duration, :demo_route

  validates_presence_of :user, :price_cents, :price_currency, :available_kwh, :min_kwh
end
