FactoryGirl.define do
  factory :workshop do
    sequence(:title) { |n| "#{n}#{Faker::Lorem.word}" }
    sequence(:context) { |n| "#{n}#{Faker::Lorem.word}" }
    location Location.first
    start_time Faker::Time.between(Time.now, 2.days.from_now, :day)
    end_time Faker::Time.between(Time.now, 2.days.from_now, :day)
    start_date Faker::Date.between(Date.today, 2.days.from_now)
    approved false
    user User.first
  end

end
