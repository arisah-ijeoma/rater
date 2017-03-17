class HeartsController < ApplicationController
  def heart
    @user = current_user
    @church = Church.find(params[:church_id])
    @user.heart!(@church)
  end

  def unheart
    @user = current_user
    @heart = @user.hearts.find_by(church_id: params[:church_id])
    @church = Church.find(params[:church_id])
    @heart.destroy!
  end
end
