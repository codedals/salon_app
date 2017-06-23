class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  helper_method :current_user, :signed_in?, :correct_user?

  #AUTH METHODS
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end    
  end

  def signed_in?
    return true if current_user
  end

  def correct_user?
    unless User.find(params[:id]) == current_user
      redirect_to root_url, :alert => "You don't have privileges to view this page."
    end
  end

  def login_required
    unless current_user
      redirect_to root_url, :alert => "Login required"
    end
  end 
  #END AUTH METHODS

 def set_parent_salon
    @salon = Salon.find(params[:salon_id])
  end
end
