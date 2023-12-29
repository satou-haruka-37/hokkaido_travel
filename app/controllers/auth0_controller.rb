class Auth0Controller < ApplicationController
  def callback
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.uid
    flash[:info] = 'ログインしました'
    redirect_to request.env['omniauth.origin'] || root_url
  end

  def logout
    reset_session
    flash[:info] = 'ログアウトしました'
    request_params = {
      returnTo: root_url,
      client_id: Rails.application.credentials.auth0.client_id
    }
    redirect_to URI::HTTPS.build(
      host: Rails.application.credentials.auth0.domain,
      path: '/v2/logout',
      query: request_params.to_query
    ).to_s,
                allow_other_host: true
  end

  def failure
    redirect_to root_url
  end
end
