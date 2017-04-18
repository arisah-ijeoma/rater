class ProfilesController < ApplicationController
  load_and_authorize_resource class: 'Profile'

  before_action :find_profile

  def show
  end

  def edit
  end

  def update
    if params[:profile][:user_attributes][:password].blank?
      params[:profile][:user_attributes].delete(:password)
    end

    if params[:profile][:user_attributes][:password].blank?
      params[:profile][:user_attributes].delete(:password_confirmation)
    end

    if @profile.update_attributes(profile_params)
      redirect_to @profile, notice: 'Profile successfully updated'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name,
                                    :avatar,
                                    :profession,
                                    :course_of_study,
                                    :brief,
                                    :state_of_origin,
                                    :state_of_residence,
                                    user_attributes: [
                                      :id,
                                      :email,
                                      :password,
                                      :password_confirmation,
                                      :phone_number,
                                      :account_type
                                    ])
  end

  def find_profile
    @profile = current_user.profile
  end
end
