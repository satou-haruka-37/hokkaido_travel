class Mypage::SettingsController < Mypage::BaseController
  before_action :set_user, only: %i[show update destroy]

  def show; end

  def update
    @user.attributes = user_params

    if validate_avatar(user_params[:avatar]) && @user.save
      @user.touch

      if request.referer == mypage_settings_url
        flash[:success] = 'ユーザーを更新しました'
        redirect_to mypage_settings_path
      else
        redirect_to request.referer || root_path
      end

    else
      render :show
    end
  end

  def destroy
    @user.posts.update_all(user_id: nil)
    @user.destroy
    flash[:info] = 'ユーザーを削除しました'
    reset_session
    redirect_to :root
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :avatar)
  end

  def validate_avatar(avatar)
    return true if avatar.blank?

    result = Vision.image_analysis(avatar)

    unless result
      flash[:error] = '不適切な画像です'
      return false
    end

    true
  end
end
