require 'faker'

FactoryBot.define do
  factory :user do
    id { 1 }
    name { Faker::Name.unique.name }
  end
end
