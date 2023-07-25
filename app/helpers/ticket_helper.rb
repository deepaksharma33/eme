module TicketHelper
  def format_address(ticket)
    company = ticket.excavator.company
    [company.address, company.city, company.state, company.zip].join(", ")
  end

  def format_asa_codes(codes)
    JSON.parse(codes).join(", ")
  end
end
