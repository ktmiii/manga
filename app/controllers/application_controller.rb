class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #ユーザーがアカウントを作成または更新するときに、これらのパラメーターが許可される
  def configure_permitted_parameters
    keys = %i[name postal_code address self_introduction profile_image]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :user_name, :gender, :birth_date])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :user_name, :gender, :birth_date, :profile_image])
  end

end
