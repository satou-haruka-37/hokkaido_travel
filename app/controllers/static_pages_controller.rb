class StaticPagesController < ApplicationController
  def top; end

  def privacy_policy; end

  def terms_of_service; end

  def contact_us; end

  def location_trouble; end

  def auth0_icon; end

  def progressive_web_apps; end

  def links; end

  def lets_login
    return unless logged_in?

    redirect_to new_post_path
  end
end
