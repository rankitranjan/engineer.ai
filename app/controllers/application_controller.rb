class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?
  protect_from_forgery
  

  protect_from_forgery with: :null_session
   rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to '/'
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:code])
  end

end
