class Mypage::PostsController < Mypage::BaseController
  def index
    @posts = current_user.posts.order(created_at: :desc).page(params[:page])
  end
end
