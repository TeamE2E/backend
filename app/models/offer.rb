class Offer < ActiveRecord::Base
  belongs_to :user
  monetize :price_cents

  validates_presence_of :user, :price_cents, :price_currency, :available_kwh, :min_kwh
end
