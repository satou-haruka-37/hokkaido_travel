class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_action :set_current_temperature

  private

  def require_login
    return if session[:user_id]

    redirect_to lets_login_path
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def set_current_temperature
    @temperature = OpenWeather.current_temperature_in_hokkaido
  end

end
