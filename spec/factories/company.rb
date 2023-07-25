# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    company_type { "Excavator" }
	end
end
