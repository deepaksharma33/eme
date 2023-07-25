# frozen_string_literal: true

FactoryBot.define do
  factory :service_area do
    primary_service_area_code { Faker::String }
    additional_service_area_codes { Faker::String }
  end
end
