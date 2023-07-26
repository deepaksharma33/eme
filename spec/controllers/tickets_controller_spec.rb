require "rails_helper"

describe V1::TicketsController, type: :request do
  describe "GET /index" do
    before do
      get '/v1/tickets'
    end

    it "responds with 200" do
      expect(response).to have_http_status(200)
    end

    it "responds with no data message if there is missing data" do
      expect(response.body).to include("There is no ticket data")
    end
  end
end
