class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:secret_code_attributes => :code])
  end

end
