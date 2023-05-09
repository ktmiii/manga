# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def reject_withdraw_user
  @user = User.find_by(user_name: params[:user][:user_name])

    if @user && @user.valid_password?(params[:user][:password]) && @user.is_deleted
      flash[:notice] = "退会済みのアカウントです。再度ご登録してご利用ください。"
      redirect_to new_customer_registration_path
    else
      flash[:alert] = "メールアドレスまたはパスワードが違います。"
      render :new
    end
  end

end
