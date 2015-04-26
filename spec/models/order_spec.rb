require 'rails_helper'

RSpec.describe Order, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:order)).to be_valid
  end
end