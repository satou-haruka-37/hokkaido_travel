class Mypage::BookmarkPostsController < Mypage::BaseController
  def index
    @posts = current_user.bookmarks_posts.order(created_at: :desc).page(params[:page])
  end
end
