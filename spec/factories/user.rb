FactoryBot.define do
  factory :user do
    email Forgery('email').address
    password '12345678'
  end
end
