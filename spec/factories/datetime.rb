# frozen_string_literal: true

FactoryBot.define do
  factory :datetime do
    response_due_date_time { DateTime.now }
	end
end
