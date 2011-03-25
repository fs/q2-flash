class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_required
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
