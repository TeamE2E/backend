class Booking < ActiveRecord::Base
  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id

  monetize :price_cents, :fee_cents, :total_amount_cents

  validates_presence_of :buyer, :seller, :lat, :lng, :price_cents, :fee_cents, :total_amount_cents, :kwh

  PERCENTAGE_FEE = 10
end
