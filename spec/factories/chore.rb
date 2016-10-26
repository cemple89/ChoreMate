require 'factory_girl_rails'

FactoryGirl.define do
  factory :chore do
    sequence(:name) { |n| "Chore ##{n}"}
    points "1"
    completion_interval "7"
    last_completed Time.now
    due_by Time.now
  end
end
