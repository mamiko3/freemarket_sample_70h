class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :image, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :year_birth_at, :month_birth_at, :day_birth_at])
  end

end
