require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
    before(:each) do
     ApplicationController.any_instance.stub(:authenticate_user!).and_return(@user = FactoryGirl.create(:user))
    end
   it "should list all products" do
     product = FactoryGirl.create(:product)
     get :index, nil, {user_id: @user.id}
     expect(response).to be_success
   end
   it "edit product" do
     product = FactoryGirl.create(:product)
     put :update,{user_id: @user.id, :id => product.id.to_param,:product=> FactoryGirl.attributes_for(:product, :price=>12).as_json}
     product.reload
     expect(product.price.to_i).to equal(12) 
   end
   it "delete product" do
     product = FactoryGirl.create(:product)
     expect { delete :destroy, :id => product.id }.to change(Product, :count)
   end
end
