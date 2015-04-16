class ApplicationController < ActionController::Base
  protect_from_forgery
  def index
    @order_today = Order.today
    @order_this_week = Order.this_week
    @order_this_month = Order.this_month
  end
end
