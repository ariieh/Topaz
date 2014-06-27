class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    
    if @user
      sign_in @user
      redirect_to @user
    else
      flash.now[:error] = ["Invalid credentials"]
      render :new
    end
  end
  
  def facebook_login
    @user = User.find_or_create_by_facebook(
    request.env['omniauth.auth'][:provider],
    request.env['omniauth.auth'][:uid],
    request.env['omniauth.auth'][:info][:name],
    request.env['omniauth.auth'][:info][:email]
    )
    sign_in @user
    redirect_to @user
  end
  
  def destroy
    sign_out
    redirect_to new_session_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
