require 'rails_helper'

RSpec.describe Product, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:product)).to be_valid
  end

  it "does not allow without title or price" do
    expect(FactoryGirl.build(:product, :title => nil)).not_to be_valid 
    expect(FactoryGirl.build(:product, :price => nil)).not_to be_valid 
  end

  it "does not allow without price as number" do
    expect(FactoryGirl.build(:product, :price => "aa")).not_to be_valid 
  end
end
