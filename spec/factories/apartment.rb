require 'factory_girl_rails'

FactoryGirl.define do
  factory :apartment do
    sequence(:address) { |n| "#{n} Fake Street"}
    city "Boston"
    state "MA"
    zip_code "02135"
  end
end
