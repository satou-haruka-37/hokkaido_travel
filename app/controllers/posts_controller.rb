class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "投稿が作成されました"
      redirect_to posts_path
    else
      @tags = Tag.all
      render :new, status: :unprocessable_entity
    end
  end

  def update
    params[:post].delete(:images) if params[:post][:images].all?(&:blank?)

    if @post.update(post_params)
      flash[:success] = "投稿が更新されました"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿が削除されました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :address, :body, tag_ids: [], images: [] )
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user
    unless current_user == @post.user
      flash[:error] = "権限がありません"
      redirect_to posts_path
    end
  end
end