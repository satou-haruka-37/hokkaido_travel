class Mypage::BookmarkPostsController < Mypage::BaseController
  def index
    @posts = current_user.bookmarks_posts.page(params[:page]).per(10)
  end
end
