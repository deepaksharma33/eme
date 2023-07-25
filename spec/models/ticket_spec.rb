
require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "relations" do
    it { is_expected.to have_one(:excavator) }
    it { is_expected.to have_one(:datetime) }
    it { is_expected.to have_one(:service_area) }
    it { is_expected.to have_one(:dig_site_info) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:excavator) }
    it { is_expected.to validate_presence_of(:datetime) }
    it { is_expected.to validate_presence_of(:service_area) }
    it { is_expected.to validate_presence_of(:dig_site_info) }
  end

  context 'after creation' do # (almost) plain English
    it 'must have excavator' do #
      expect { Ticket.create! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
    end
  end
end