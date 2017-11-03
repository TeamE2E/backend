FactoryBot.define do
  factory :offer do
    association :user
    price_cents (20..60).to_a.sample
    price_currency 'eur'
    available_kwh (30..100).to_a.sample
    min_kwh 1
  end
end
