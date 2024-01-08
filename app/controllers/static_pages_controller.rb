class StaticPagesController < ApplicationController
  before_action :set_current_temperature

  def top; end

  def privacy_policy; end

  def terms_of_service; end

  def location_trouble; end

  def auth0_icon; end

  def lets_login
    if logged_in?
      redirect_to new_post_path
    end
  end
end
