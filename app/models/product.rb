class Product < ActiveRecord::Base
  has_many :order_products
  has_many :orders, :through => :order_products
end
