require "rails_helper"

RSpec.describe Excavator, type: :model do
  describe "relations" do
    it { is_expected.to belong_to(:ticket) }
    it { is_expected.to have_one(:company) }
  end
end
