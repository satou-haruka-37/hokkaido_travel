class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  def index
    if params[:q].present? && params[:q][:title_or_body_cont].present?
      search_param = Post.normalize_search_string(params[:q][:title_or_body_cont])
      # OR条件で検索するために`_any`を使って配列を渡す
      @q = Post.ransack(title_or_body_cont_any: search_param.split(/[[:space:]]+/))
    else
      @q = Post.ransack(params[:q])
    end

    @posts = if params[:tag_id].present?
               tag = Tag.find_by(id: params[:tag_id])
               tag.present? ? tag.posts : []
             elsif params[:season_id].present?
               season = Season.find_by(id: params[:season_id])
               season.present? ? season.posts : []
             else
               @q.result
             end
    @filtering_active = params[:q].present? || params[:tag_id].present? || params[:season_id].present?
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if validate_images(post_params[:images]) && @post.save
      flash[:success] = '投稿が作成されました'
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    params[:post].delete(:images) if params[:post][:images].all?(&:blank?)

    @post.attributes = post_params

    if validate_images(post_params[:images]) && @post.save
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

  def latest_posts
    @posts = Post.order(created_at: :desc).limit(20)
  end

  def nearby_posts
    post = Post.find(params[:id])
    nearby_posts = post.nearbys(params[:distance]).limit(3)

    render json: nearby_posts.as_json(only: %i[id title latitude longitude images])
  end

  private

  def post_params
    params.require(:post).permit(:title, :address, :body, :images_cache, tag_ids: [], season_ids: [], images: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user
    return if current_user && (current_user == @post.user || current_user.admin?)

    flash[:error] = '権限がありません'
    redirect_to posts_path
  end

  def validate_images(images)
    return true if images.blank? || images.all?(&:blank?)

    cleaned_images = images.reject(&:blank?) # imagesに空の値が含まれる場合はimage_analysisメソッドでエラーが起こるため除去
    inappropriate_images = []

    cleaned_images.each do |image|
      result = Vision.image_analysis(image)
      inappropriate_images << image unless result
    end

    if inappropriate_images.any?
      flash[:error] = '不適切な画像が含まれています'
      return false
    end

    true
  end
end
