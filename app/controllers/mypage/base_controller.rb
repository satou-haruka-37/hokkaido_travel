module Mypage
  class BaseController < ApplicationController
    layout 'mypage/layouts/mypage'
    before_action :require_login
  end
end
