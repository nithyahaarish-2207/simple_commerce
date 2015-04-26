require 'rails_helper'

RSpec.describe Order, :type => :model do
  it "have created a relationship with Product" do
    product = Product.create(title: "test-prod", description: "just chilling", price: "90")
    order = Order.create(status: false)
    order.products << product
    OrderProduct.first.order.should == order
    OrderProduct.first.product.should == product
  end
end
