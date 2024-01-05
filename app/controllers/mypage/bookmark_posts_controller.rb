class Mypage::BookmarkPostsController < Mypage::BaseController
  def index
    @posts = current_user.bookmarks_posts.page(params[:page])
  end
end
