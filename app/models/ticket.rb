class Ticket < ApplicationRecord
  paginates_per 25

  has_one :excavator
  has_one :datetime
  has_one :service_area
  has_one :dig_site_info

  validates_presence_of :excavator
  validates_presence_of :datetime
  validates_presence_of :service_area
  validates_presence_of :dig_site_info
end
