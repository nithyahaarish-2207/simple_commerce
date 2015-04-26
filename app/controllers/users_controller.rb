class UsersController < ApplicationController
 def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:notice] = "New user added"
        format.html { redirect_to orders_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def sign_in
  end
  
  def authenticate
  user = User.find_by_email(params[:user][:email])
  p user
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect_to orders_path, :notice => "Logged in!"
  else
    flash[:danger] = "Invalid email or password"
    redirect_to root_url
  end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
