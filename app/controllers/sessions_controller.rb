class SessionsController < ApplicationController

  skip_before_action :authorize
  skip_before_action :verify_authenticity_token

  def new
  end

  ##
  # Create is creating a session not the DB entry itself.
  # Corresponding to 'new' view where the login screen is located
  #
  def create
    user = User.find_by(name: params[:name]) # If found by name in DB
    if user.try(:authenticate, params[:password]) # Compare password HASH
      session[:user_id] = user.id # If good create session[id]
      redirect_to admin_url # Redirect to
    else
      redirect_to login_url # Redirect back to login. Login wasn't successful
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end
end
