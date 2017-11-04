class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    offer = Offer.find params[:offer_id]
    if current_user == offer.user
      return render json: {msg: 'invalid actor'}, status: 403
    end

    booking = Booking.new
    booking.buyer = current
    booking.seller = offer.user
    booking.price = offer.price
    booking.fee = Booking::PERCENTAGE_FEE / 100 * offer.price
    booking.total_amount = offer.price + booking.fee
    booking.lat = current_user.location.lat
    booking.lng = current_user.location.lng
    booking.kwh = offer.kwh

    begin
      booking.save!
      msg = {msg: 'Succes'}
      code = 201
    rescue Exception => e
      msg = {msg: booking.errors.to_sentece}
      code = 422
    end
    render json: msg, status: code
  end
end
