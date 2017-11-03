class OffersController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = Location.within(10, origin: current_user.location).where.not(user: current_user)
    @articles = Offer.all()
    render json: @articles
  end
end
