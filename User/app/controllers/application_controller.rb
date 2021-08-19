class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :require_login

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  helper_method :current_user

  private
  def require_login
    redirect_to '/sessions/new' unless current_user
  end

  # Prevents user from seeing users show page if not their own
  def require_authentication
    redirect_to "/users/#{current_user.id}" unless current_user.id == params[:id].to_i
  end
end
