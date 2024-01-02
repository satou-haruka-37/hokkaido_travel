class BookmarksController < ApplicationController
  before_action :require_login

  def create
    post = Post.find(params[:post_id])
    current_user.bookmark(post)
    redirect_to post_path(post)
  end

  def destroy
    post = current_user.bookmarks_posts.find(params[:post_id])
    current_user.bookmark_destroy(post)
    if request.referer == mypage_bookmark_posts_url
      redirect_to mypage_bookmark_posts_path
    else
      redirect_to post_path(post)
    end
  end
end
