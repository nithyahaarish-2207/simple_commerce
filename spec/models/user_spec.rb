require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it "does not allow duplicate email" do
    FactoryGirl.create(:user)
    expect(FactoryGirl.build(:user)).not_to be_valid 
  end
  it "does not allow without email or password" do
    expect(FactoryGirl.build(:user, :email => nil)).not_to be_valid 
    expect(FactoryGirl.build(:user, :password => nil)).not_to be_valid 
  end
end
