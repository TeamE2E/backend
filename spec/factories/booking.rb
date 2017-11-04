FactoryBot.define do
  factory :booking do
    association :buyer, factory: :user
    association :seller, factory: :user
    lat Forgery('geo').latitude
    lng Forgery('geo').longitude

    before(:create) do |booking, evaluator|
      offer = create(:offer)
      booking.price_cents = offer.price_cents
      booking.price_currency = offer.price_currency
      booking.fee_cents = Booking::PERCENTAGE_FEE / 100 * offer.price_cents
      booking.fee_currency = offer.price_currency
      booking.total_amount_cents = offer.price_cents + booking.fee_cents
      booking.total_amount_currency = offer.price_currency
      booking.kwh = (offer.min_kwh..offer.available_kwh).to_a.sample

      booking.save!
    end
  end
end
