class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to root_url#, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url#, :notice => "Signed Out"
  end

  def failure
  end

end
