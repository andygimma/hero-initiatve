FactoryGirl.define do
  factory :location do
    name "First location"
    address "293 himrod st"
    city "Brooklyn"
    state "New York"
    phone1 "1234567"
    email Faker::Internet.email
    user User.first
  end
end
