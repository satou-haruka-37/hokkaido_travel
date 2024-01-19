module Mypage
  class BookmarkPostsController < Mypage::BaseController
    def index
      @posts = current_user.bookmarks_posts.order(created_at: :desc).page(params[:page])
    end
  end
end
