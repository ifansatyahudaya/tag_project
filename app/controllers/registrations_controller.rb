  class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :company_subdomain, :company_name])
    super
  end

  def account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :company_subdomain, :company_name])
    super
  end
end
