class Api::UsersController < ApplicationController
  def create
    # @user = User.new(user_params)
    #
    # if @user.save
    #   Notification.create(notification_type: 1, user_id: @user.id, url: static_pages_welcome_url)
    #   DailyBrief.welcome_email(@user).deliver
    #   sign_in @user
    #   redirect_to @user
    # else
    #   flash.now[:error] = @user.errors.full_messages
    #   render :new
    # end
  end
  
  def index
    @users = User.all.to_a
    
    # @users.each_with_index do |user, index|
    #   @users[index] = user.hashify
    # end
    render :index
  end
  
  def show
    @user = User.find(params[:id])
    # render json: @user.hashify
    # @user = User.find(params[:id])
    render partial: "api/users/user", locals: { user: @user }
  end
  
end