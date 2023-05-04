class Public::UsersController < ApplicationController

  def show
  end

  def edit
  end

  def update
  end

  def withdraw
  end

  def unsubscribe
  end


  private
  def user_params
    params.require(:user).permit( :image)
  end
end
