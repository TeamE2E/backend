class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    offer = Offer.find params[:offer_id]
    email = params[:email]
    # current_user ||= User.find 1

    if current_user == offer.user
      return render json: {msg: 'invalid actor'}, status: 403
    end

    booking = Booking.new
    booking.buyer = current_user
    booking.seller = offer.user
    booking.price = offer.price
    booking.fee = Booking::PERCENTAGE_FEE / 100 * offer.price
    booking.total_amount = offer.price + booking.fee
    booking.lat = current_user.location.lat
    booking.lng = current_user.location.lng
    booking.kwh = offer.kwh

    begin
      booking.save!
      BookingMailer.created(booking, email).deliver_now
      msg = {msg: 'Succes', id: booking.id}
      code = 201
    rescue Exception => e
      msg = {msg: booking.errors.to_sentece}
      code = 422
    end
    render json: msg, status: code
  end
end
