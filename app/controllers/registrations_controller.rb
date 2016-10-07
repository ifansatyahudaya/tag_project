class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    yield resource if block_given?
    respond_to do |format|
      format.html { respond_with resource}
      format.js { render :new, locals: { resource: resource } }
    end
  end

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
