class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def authorize
    redirect_to signin_path unless current_user
  end
end
