class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      @tags = Tag.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :address, :body, tag_ids: [])
  end
end
