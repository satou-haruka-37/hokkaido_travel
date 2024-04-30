class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_action :set_weather, :modal_name_setting

  private

  def require_login
    return if sesion[:user_id]

    redirect_to lets_login_path
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def set_weather
    @weather = OpenWeather.current_weather_in_sapporo

    @fair_conditions = WeatherHelper::FAIR_CONDITIONS
    @inclement_conditions = WeatherHelper::INCLEMENT_CONDITIONS
    @others_conditions = WeatherHelper::OTHERS_CONDITIONS
  end

  def modal_name_setting
    return unless logged_in?
    return unless current_user.created_at == current_user.updated_at

    @unset_user = true
    @user = current_user
  end
end
