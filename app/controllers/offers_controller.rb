class OffersController < ApplicationController
  before_action :authenticate_user!

  def index
    locations = Location.within(10, origin: current_user.location).where.not(user: current_user)
    user_ids = locations.map(&:user_id)
    @offers = Offer.where(user_id: user_ids)
    @offers.each do |offer|
      offer.fee = offer.price_cents * 10 / 100
      offer.total_amount = offer.price_cents + offer.fee
      offer.distance = offer.user.location.distance_from(current_user.location)
    end

    render json: @offers, include: [user: {include: :location}], methods: [:fee, :total_amount, :distance]
  end
end
