FactoryBot.define do
  factory :location do
    association :user
    lat Forgery('geo').latitude
    lng Forgery('geo').longitude
  end
end
