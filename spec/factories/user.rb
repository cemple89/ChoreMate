require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person ##{n}"}
end
