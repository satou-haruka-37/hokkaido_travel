module Mypage
  class SettingsController < Mypage::BaseController
    before_action :set_user, only: %i[show update destroy]

    def show; end

    def update
      @user.assign_attributes(user_params)
      # 保存前にupdated_at以外に変更があるかチェック
      changes_without_updated_at = @user.changed - ['updated_at']

      if validate_avatar(user_params[:avatar]) && @user.save
        @user.touch # 初期設定モーダルであとで設定を押すとupdated_atのみ更新される（２回目のモーダルが出なくなる）

        # updated_at以外に変更があった場合のみフラッシュメッセージを表示
        flash[:success] = 'ユーザーを更新しました' if changes_without_updated_at.any?

        # リダイレクト処理
        if request.referer == mypage_settings_url
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
end
