class SessionsController < ApplicationController
  def new
    render :layout => 'landing'
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to customers_url, notice: "You have been signed in!"
    else
      flash.now[:alert] = "Username or password is invalid"
      render "new"
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url, notice: "You have been signed out!"
  end
end
