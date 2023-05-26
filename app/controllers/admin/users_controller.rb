class Admin::UsersController < ApplicationController

  def index
    @users = User.all.page(params[:page]).per(9)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render edit
    end
  end

  private
  def user_params
    params.require(:user).permit( :image, :email, :password, :user_name, :gender, :birth_date, :is_deleted)
  end

end
