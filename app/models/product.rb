class Product < ActiveRecord::Base
  has_many :order_products
  has_many :orders, :through => :order_products
  validates_presence_of :title, :price
  validates :price, numericality: true
end
