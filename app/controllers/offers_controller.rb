class OffersController < ApplicationController
  # before_action :authenticate_user!

  def index
    locations = Location.within(Location::RADIUS, origin: current_user.location).where.not(user: current_user)
    user_ids = locations.map(&:user_id)
    @offers = Offer.where(user_id: user_ids)
    gmaps = GoogleMapsService::Client.new
    @offers.each do |offer|
      begin
        offer.fee = offer.price_cents * Booking::PERCENTAGE_FEE / 100
        offer.total_amount = offer.price_cents + offer.fee
        offer.distance = offer.user.location.distance_from(current_user.location)
        offer.duration = nil
        if offer.distance <= Location::RADIUS
          routes = gmaps.directions(offer.user.location.to_s, current_user.location.to_s, mode: 'driving')
          if routes.present?
            route = routes.first
            encoded_path = route.dig(:overview_polyline)
            path = GoogleMapsService::Polyline.decode(encoded_path.dig(:points))
            offer.duration = route.dig(:legs).first.dig(:duration, :text)
            offer.demo_route = path
          end
        end
      rescue Exception => e
        next
      end
    end

    render json: @offers, include: [user: {include: :location}], methods: [:fee, :total_amount, :distance, :duration, :demo_route]
  end

  def show
    offer = Offer.find params[:id]
    offer.fee = offer.price_cents * Booking::PERCENTAGE_FEE / 100
    offer.total_amount = offer.price_cents + offer.fee

    render json: offer, methods: [:fee, :total_amount]
  end
end
