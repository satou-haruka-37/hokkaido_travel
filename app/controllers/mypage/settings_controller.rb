class Mypage::SettingsController < Mypage::BaseController
  before_action :set_user, only: %i[show update destroy]

  def show; end

  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザーを更新しました'
      redirect_to mypage_settings_path
    else
      render :show
    end
  end

  def destroy
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
    params.require(:user).permit(:name)
  end
end
