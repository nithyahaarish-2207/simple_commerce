class ApplicationController < ActionController::Base
  protect_from_forgery
  protected
  def authenticate_user!
    unless session[:user_id]
      redirect_to root_url, :notice => 'if you want to add a notice'
    end
  end
end
