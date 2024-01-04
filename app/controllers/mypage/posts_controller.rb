class Mypage::PostsController < Mypage::BaseController
  def index
    @posts = current_user.posts.page(params[:page])
  end
end
