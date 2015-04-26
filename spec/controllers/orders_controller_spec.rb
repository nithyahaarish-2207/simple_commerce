require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
    before(:each) do
     ApplicationController.any_instance.stub(:authenticate_user!).and_return(@user = FactoryGirl.create(:user))
    end
  it "create New Order" do  
	products = [FactoryGirl.create(:product), FactoryGirl.create(:product, :title =>"test2")]
	expect{post :create, :ids=> products.map(&:id)}.to change(Order, :count)
  end
  it "edit Order" do  
	order = FactoryGirl.create(:order)
	get :edit, {:id=> order.id,user_id: @user.id}
    order.reload
    expect(order.status).to equal(true)
  end
  it "delete Order" do  
	order = FactoryGirl.create(:order)
	expect{delete :destroy, {:id=> order.id,user_id: @user.id}}.to change(Order, :count)
  end
end
