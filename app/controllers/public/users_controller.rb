class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def withdraw
  end

  def unsubscribe
    @user = current_user
    if @user.update(is_deleted: true)
      sign_out @user
      redirect_to root_path, notice: "退会が完了しました。"
    else
      redirect_to delete_confirmation_user_path, alert: "退会に失敗しました。"
    end
  end


  private
  def user_params
    params.require(:user).permit( :image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
