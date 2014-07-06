class Api::UsersController < ApplicationController
  def create
  end
  
  def index
    @users = User.all.to_a
    render :index
  end
  
  def show
    @user = User.find(params[:id])
    render partial: "api/users/user", locals: { user: @user }
  end
  
end