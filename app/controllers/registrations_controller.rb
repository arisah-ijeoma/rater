class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:phone_number,
                                 :account_type,
                                 :state_of_origin,
                                 :state_of_residence,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:phone_number,
                                 :account_type,
                                 :state_of_origin,
                                 :state_of_residence,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :current_password)
  end
end
