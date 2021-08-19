class SessionsController < ApplicationController
  
  skip_before_action :require_login, except: [:destroy]

  def new
    #render login page
  end

  def create
    puts 'login user'
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = ["Invalid Credentials"]
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session.clear
    redirect_to '/sessions/new'
  end
end
