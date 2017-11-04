FactoryBot.define do
  factory :user do
    email { "user_#{Random.rand(10_000).to_s}@factory.com" }
    password '12345678'
  end
end
