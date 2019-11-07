class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:firstname, :lastname, :email, :password, :password_confirmation, :description)
    end
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:firstname, :lastname, :email, :current_password, :password, :password_confirmation, :description)}
  end


end
