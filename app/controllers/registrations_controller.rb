class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    super
  end

  def account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    super
  end
end
