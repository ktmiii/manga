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

  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  protected

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_user
    @user = User.find_by(user_name: params[:user][:user_name])
      if @user.nil? || !@user.valid_password?(params[:user][:password]) || @user.is_deleted
        flash[:alert] = "メールアドレスまたはパスワードが違います。"
        render :new
      else
        flash[:notice] = "退会済みのアカウントです。再度ご登録してご利用ください。"
        redirect_to new_user_registration_path
      end
  end

end
