class OffersController < ApplicationController
  before_action :authenticate_user!

  def index
    locations = Location.within(10, origin: current_user.location).where.not(user: current_user)
    user_ids = locations.map(&:user_id)
    @offers = Offer.where(user_id: user_ids)

    render json: @offers
  end
end
