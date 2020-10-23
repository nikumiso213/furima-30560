class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password,:nick_name,:family_name,:first_name,:family_name_kana,:first_name_kana,:date_of_birth])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
  end
end
