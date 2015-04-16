class OrdersController < ApplicationController
  
  def dashboard_index
    @order_today = Order.today
    @order_this_week = Order.this_week
    @order_this_month = Order.this_month
  end
  
  def index
    @orders = Order.all
    @order_today = Order.today
    @order_this_week = Order.this_week
    @order_this_month = Order.this_month
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create

  end
end
