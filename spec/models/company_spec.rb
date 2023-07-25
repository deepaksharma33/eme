require "rails_helper"

RSpec.describe Company, type: :model do
  describe "relations" do
    it { is_expected.to belong_to(:excavator) }
  end
end
