require "rails_helper"

RSpec.describe DigSiteInfo, type: :model do
  describe "relations" do
    it { is_expected.to belong_to(:ticket) }
  end
end
