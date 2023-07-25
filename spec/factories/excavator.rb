# frozen_string_literal: true

FactoryBot.define do
  factory :excavator do
    crew_onsite { Faker::Boolean }
  end
end
