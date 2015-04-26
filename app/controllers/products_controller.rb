class ProductsController < ApplicationController
  before_filter :authenticate_user!

 def index
    @products = Product.find(:all, :order=>("created_at DESC"))
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = "New product added"
        format.html { redirect_to products_path, notice: 'product was successfully created.' }
      else
        flash[:notice] = "Form is invalid"
        format.html { render action: "new" }
      end
    end
  end
  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to products_path, notice: 'product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

 def destroy
   Product.find(params[:id]).destroy
   redirect_to products_path
 end
end
