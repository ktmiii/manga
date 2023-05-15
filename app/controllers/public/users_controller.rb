class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @age_group = @user.age_group
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @review_likes = ReviewLike.where(user_id: current_user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
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
    params.require(:user).permit( :profile_image, :email, :password, :user_name, :gender, :birth_date, :is_deleted)
  end

end
