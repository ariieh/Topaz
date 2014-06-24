class UsersController < ApplicationController
  before_action :check_if_correct_user, :only => [:show]
  
  def new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      sign_in @user
      redirect_to @user
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def check_if_correct_user
    @user = User.find(params[:id])
    unless signed_in? && current_user.id == @user.id
      flash[:errors] = ["You need to sign in!"]
      redirect_to new_session_url
    end
  end
end