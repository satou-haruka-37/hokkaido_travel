class BookmarksController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.bookmark(post)
    redirect_to post_path(post)
  end

  def destroy
    post = current_user.bookmarks_posts.find(params[:post_id])
    current_user.bookmark_destroy(post)
    redirect_to post_path(post)
  end
end
