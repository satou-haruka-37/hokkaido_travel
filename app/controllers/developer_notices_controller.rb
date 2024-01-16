class DeveloperNoticesController < ApplicationController
  before_action :authorize_user, only: %i[new create edit update destroy]
  before_action :set_developer_notice, only: %i[show edit update destroy]

  def index
    @developer_notices = DeveloperNotice.all.order(created_at: :desc).page(params[:page])
  end

  def show; end

  def new
    @developer_notice = DeveloperNotice.new
  end

  def create
    @developer_notice = DeveloperNotice.new(developer_notice_params)
    if @developer_notice.save
      redirect_to developer_notices_path, notice: 'お知らせを作成しました。'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @developer_notice.update(developer_notice_params)
      redirect_to developer_notice_path(@developer_notice), notice: 'お知らせを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @developer_notice.destroy
    redirect_to developer_notices_path, notice: 'お知らせを削除しました。'
  end


  private

  def developer_notice_params
    params.require(:developer_notice).permit(:title, :body)
  end

  def set_developer_notice
    @developer_notice = DeveloperNotice.find(params[:id])
  end

  def authorize_user
    return if current_user && current_user.admin?

    flash[:error] = '権限がありません'
    redirect_to developer_notices_path
  end
end
