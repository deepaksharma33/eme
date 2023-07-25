# frozen_string_literal: true

module V1
  class TicketsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      @tickets = Ticket.includes({ excavator: :company }, :datetime, :service_area, :dig_site_info).page(params[:page])
    end

    def show
      @ticket = Ticket.find(params[:id])
    end

    def create
      build_associations

      render json: { message: 'Ticket created successfully', status: :ok } if ticket.save!
    end

    private

    def build_associations
      ticket.excavator = excavator

      excavator.company = company

      ticket.datetime = datetime

      ticket.service_area = service_area

      ticket.dig_site_info = dig_site_info
    end

    def ticket
      @ticket ||= Ticket.new(request_number: params[:request_number],
                             sequence_number: params[:sequence_number],
                             request_type: params[:request_type])
    end

    def company
      info = params[:excavator]
      @company ||= Company.new(name: info[:company_name],
                               address: info[:address],
                               city: info[:city],
                               state: info[:state],
                               zip: info[:zip],
                               company_type: info[:type])
    end

    def excavator
      @excavator ||= Excavator.new(crew_onsite: params[:excavator][:crew_onsite])
    end

    def datetime
      @datetime ||= Datetime.new(response_due_date_time: params[:date_times][:response_due_date_time])
    end

    def service_area
      @service_area ||= ServiceArea.new(
        primary_service_area_code: params[:service_area][:primary_service_area_code][:sa_code],
        additional_service_area_codes: params[:service_area][:additional_service_area_codes][:sa_code].to_s
      )
    end

    def dig_site_info
      @dig_site_info ||= DigSiteInfo.new(well_known_text: params[:excavation_info][:digsite_info][:well_known_text])
    end
  end
end
