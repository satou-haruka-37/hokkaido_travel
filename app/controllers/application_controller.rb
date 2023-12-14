class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def require_login
    redirect_to root_path unless session[:user_id]
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end
end