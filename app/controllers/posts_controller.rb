class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      @tags = Tag.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :address, :body, tag_ids: [])
  end
end
