class UsersController < ApplicationController

  before_action :require_authentication

  def new
  
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  
  end
end
