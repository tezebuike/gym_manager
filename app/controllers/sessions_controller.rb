class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to root_url, notice: "You have been signed in!"
    else
      flash.now[:alert] = "Username or password is invalid"
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: "You have been signed out!"
  end
end
