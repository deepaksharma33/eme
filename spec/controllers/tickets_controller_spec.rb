require "rails_helper"

describe V1::TicketsController, type: :request do
  describe "GET /index" do
    before do
      get '/v1/tickets'
    end

    it "responds with 200" do
      expect(response).to have_http_status(:ok)
    end

    it "responds with no data message if there is missing data" do
      expect(response.body).to include("There is no ticket data")
    end
  end

  describe "GET /show" do
    before do
      ticket = Ticket.new(request_number: Faker::Number.number(digits: 10),
                          sequence_number: Faker::Number.number(digits: 10),
                          request_type: Faker::String.random)
      ticket.excavator = Excavator.new(crew_onsite: true)
      ticket.datetime = Datetime.new(response_due_date_time: DateTime.now)
      ticket.service_area = ServiceArea.new(primary_service_area_code: Faker::Code.asin,
                                            additional_service_area_codes: Faker::Code.asin)
      ticket.dig_site_info = DigSiteInfo.new(well_known_text: "POLYGON((-81.05047525138554 32.042681017283066,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))")
      ticket.save
      get "/v1/tickets/#{ticket.id}"
    end

    it "responds with 200" do
      expect(response).to have_http_status(:ok)
    end
  end
end
