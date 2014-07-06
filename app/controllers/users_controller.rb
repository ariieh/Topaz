class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      Notification.create(notification_type: 1, user_id: @user.id, article_id: nil)
      DailyBrief.welcome_email(@user).deliver
      sign_in @user
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
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
end