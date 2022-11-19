class ApplicationController < ActionController::API
  include UserFromToken
  respond_to :json
  before_action :configure_permitted_parameters, if: :devise_controller?

rescue_from CanCan::AccessDenied do |exception|
  render json: {message:exception}, status: :unauthorized
end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password role])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end
end
