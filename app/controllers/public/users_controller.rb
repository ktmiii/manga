class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @age_group = @user.age_group
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
    params.require(:user).permit( :image, :email, :password, :user_name, :gender, :birth_date, :is_deleted)
  end

end
