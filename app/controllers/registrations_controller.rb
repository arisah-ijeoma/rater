class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:phone_number,
               :account_type,
               :email,
               :password,
               :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:phone_number,
               :account_type,
               :email,
               :password,
               :password_confirmation,
               :current_password)
    end
  end

  def after_sign_up_path_for(resource)
    current_user.profile
  end
end
