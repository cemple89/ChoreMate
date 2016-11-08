require 'factory_girl_rails'

FactoryGirl.define do
  factory :apartment do
    sequence(:name) { |n| "#{n} Fake Apartment"}
    sequence (:zip_code) {|n| "#{n}2135"}
    secret "samplesecret"
  end
end
