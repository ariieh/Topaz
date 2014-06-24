class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :signed_in?, :current_user
  
  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end
  
  def sign_in(user)
    @current_user = user
    session[:token] = user.reset_session_token!
  end
  
  def sign_out
    @current_user = nil
    session[:token] = nil
  end
  
  def signed_in?
    current_user.present?
  end
  
  def check_if_signed_in
    redirect_to new_session_url unless signed_in?
  end
end