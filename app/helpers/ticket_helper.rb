module TicketHelper
  def format_address(ticket)
    company = ticket.excavator.company
    [company.address, company.city, company.state, company.zip].join(", ")
  end

  def format_asa_codes(codes)
    JSON.parse(codes).join(", ")
  end

  def site_image_url(ticket)
    url = "https://maps.geoapify.com/v1/staticmap?style=osm-carto&width=600&height=400&zoom=8.8809&geometry=polygon:#{polygon_coords(ticket)};linewidth:5;linecolor:%23ff6600;linestyle:dashed;fillcolor:%236600ff;lineopacity:1;fillopacity:0.8&apiKey=#{ENV["GEOAPIFY_SECRET_KEY"]}"

    url
  end

  def map_center(ticket)
    polygon_coords_arr(ticket).first.join(",")
  end

  def polygon_coords(ticket)
    polygon_coords_arr(ticket).join(",")
  end

  def polygon_coords_arr(ticket)
    coords_str = ticket.dig_site_info.well_known_text

    coords_str.split("((").second.split("))").first.split(",").map { |cords| cords.split(" ")}
  end
end
