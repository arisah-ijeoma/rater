class ProfilesController < ApplicationController
  load_and_authorize_resource class: 'Profile'

  def show
    @profile = Profile.find_by(id: params[:id])
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      redirect_to @profile, notice: 'Profile successfully updated'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name,
                                    :profile_picture,
                                    :profession,
                                    :course_of_study,
                                    :brief,
                                    user_attributes: [
                                      :id,
                                      :email,
                                      :password,
                                      :password_confirmation,
                                      :phone_number,
                                      :account_type,
                                      :state_of_origin,
                                      :state_of_residence
                                    ])
  end
end