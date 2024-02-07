require "rails_helper"

RSpec.describe Challenge, type: :model do

  describe "relationships" do
    it {should have_many :projects}
  end
end
