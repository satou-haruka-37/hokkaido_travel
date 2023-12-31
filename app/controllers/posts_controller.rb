class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = if params[:tag_id].present?
               tag = Tag.find_by(id: params[:tag_id])
               tag.present? ? tag.posts : []
             else
               @q.result
             end
    @filtering_active = params[:q].present? || params[:tag_id].present?
  end

  def show; end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = '投稿が作成されました'
      redirect_to posts_path
    else
      @tags = Tag.all
      render :new
    end
  end

  def update
    params[:post].delete(:images) if params[:post][:images].all?(&:blank?)

    if @post.update(post_params)
      flash[:success] = '投稿が更新されました'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿が削除されました'

    if request.referer == mypage_posts_url
      redirect_to mypage_posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :address, :body, tag_ids: [], images: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user
    return if current_user == @post.user

    flash[:error] = '権限がありません'
    redirect_to posts_path
  end
end
