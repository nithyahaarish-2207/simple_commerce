require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  it "register as user" do  
	user ={"users"=>{"email"=>"preethi@gmail.com", "password"=>"password", "password_confirmation"=>"password"}}
	user1 = user.as_json
	post :create, user1
  end
  it "sign as user" do
    FactoryGirl.create(:user)
	user ={"user"=>{"email"=>"nithyahaarish@gmail.com", "password"=>"nithyahaarish"}}
	user1 = user.as_json
	post :authenticate, user1
  end
  it "log out" do
    user = FactoryGirl.create(:user)
	delete :destroy
  end

end
