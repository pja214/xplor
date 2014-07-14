FactoryGirl.define do
  factory :blog do
    name Faker::Address.street_name
    url Faker::Internet.url
  end
end