class OrdersController < ApplicationController

  def index
    @orders = Order.all
    @order_today = Order.today
    @order_this_week = Order.this_week
    @order_this_month = Order.this_month
  end

  def new
    @order = Order.new
  end

  def edit
    Order.find(params[:id]).update_attributes(:status => true)
    redirect_to orders_path
  end

  def create
   total_price = Product.sum(:price, :conditions =>{:id => params[:ids]})
   order = Order.create()
   params[:ids].each { |p_id| order.order_products.create(:product_id => p_id ) }
   order.update_attributes(:total_price => total_price, :item_count => params[:ids].count)
      if order.save
        if request.xhr?
          flash[:notice] = "Order Created"
          flash.keep(:notice) # Keep flash notice around for the redirect.
          render :js => "window.location = #{orders_path.to_json}"
        end
      end
   #~ redirect_to orders_path
 end
 
 def view
  @order = Order.find(params[:id])
  @line_items = @order.products
  p  @line_items
 end

 def destroy
   Order.find(params[:id]).destroy
   redirect_to orders_path
 end
end
